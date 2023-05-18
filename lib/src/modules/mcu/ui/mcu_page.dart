import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/src/core/extensions/navigator.dart';
import 'package:marvel/src/core/mixins/loader.dart';
import 'package:marvel/src/core/mixins/messages.dart';
import 'package:marvel/src/core/styles/app_text_styles.dart';

import '../models/movies.dart';
import '../presenter/controllers/bloc/mcu_bloc.dart';
import 'widget/card_movie.dart';

class McuPage extends StatefulWidget {
  const McuPage({Key? key}) : super(key: key);

  @override
  State<McuPage> createState() => _McuPageState();
}

class _McuPageState extends State<McuPage> with Loader, Messages {
  late final McuBloc controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<McuBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.add(GetMovies());
    });
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void _onSuccess() {
    hideLoader();
    showSuccess('Filmes listados com sucesso');
  }

  void _onFailure(String message) {
    hideLoader();
    showError(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: BlocConsumer<McuBloc, McuState>(
          bloc: controller,
          listener: (context, state) {
            switch (state) {
              case McuLoading():
                showLoader();
              case McuSuccess():
                _onSuccess();

              case McuFailure():
                _onFailure(state.message);
              case _:
            }
          },
          builder: (_, state) => switch (state) {
            McuSuccess(:final movies) => _SuccessPage(
                movies: movies,
              ),
            McuFailure() => const _FailurePage(),
            _ => const SizedBox.shrink()
          },
        ),
      ),
    );
  }
}

class _SuccessPage extends StatelessWidget {
  final List<Movies> movies;
  const _SuccessPage({required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 250,
        mainAxisSpacing: 30,
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 50,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CardMovie(
          movie: movies[index],
          onPressed: () {
            context.pushNamedDetails(movies[index].id!);
          },
        );
      },
    );
  }
}

class _FailurePage extends StatelessWidget {
  const _FailurePage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: context.appTextStyles.textRegular,
        ),
        onPressed: () => context.read<McuBloc>().add(GetMovies()),
        child: const Text('Tentar novamente'),
      ),
    );
  }
}
