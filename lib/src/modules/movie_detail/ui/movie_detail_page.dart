import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/src/core/extensions/date_formatter.dart';
import 'package:marvel/src/core/extensions/size.dart';
import 'package:marvel/src/modules/movie_detail/models/movie.dart';

import '../../../core/mixins/loader.dart';
import '../../../core/mixins/messages.dart';
import '../presenter/controllers/bloc/movie_detail_bloc.dart';
import 'widgets/row_info.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;

  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with Loader, Messages {
  late final MovieDetailBloc controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<MovieDetailBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.add(GetMovieDetailEvent(widget.id));
    });
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void _onSuccess() {
    hideLoader();
    showSuccess('Detalhes com sucesso');
  }

  void _onFailure(String message) {
    hideLoader();
    showError(message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailBloc, MovieDetailState>(
      listener: (context, state) {
        switch (state) {
          case MovieDetailLoading():
            showLoader();
          case MovieDetailSuccess():
            _onSuccess();
          case MovieDetailFailure(:final message):
            _onFailure(message);
          case _:
        }
      },
      builder: (context, state) => switch (state) {
        MovieDetailSuccess(:final movie) => _SuccessPage(movie: movie),
        MovieDetailFailure() => _FailurePage(widget.id),
        _ => const SizedBox.shrink()
      },
    );
  }
}

class _SuccessPage extends StatefulWidget {
  final Movie movie;
  const _SuccessPage({required this.movie});

  @override
  State<_SuccessPage> createState() => __SuccessPageState();
}

class __SuccessPageState extends State<_SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  widget.movie.posterPath!,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/movies/capitao2.jpg');
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Titulo origital',
                info: widget.movie.originalTitle!,
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Titulo traduzido',
                info: widget.movie.title!,
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Data de lançamento',
                info: widget.movie.releaseDate!.formatterDatePTBR,
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Popularidade',
                info: '${widget.movie.popularity}',
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Lingua Original',
                info: '${widget.movie.originalLanguage}',
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Sinopse',
                info: '${widget.movie.overview}',
              ),
              const SizedBox(
                height: 10,
              ),
              RowInfo(
                title: 'Pontuação',
                info: '${widget.movie.voteAverage}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FailurePage extends StatelessWidget {
  final int id;
  const _FailurePage(this.id);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () =>
            context.read<MovieDetailBloc>().add(GetMovieDetailEvent(id)),
        child: const Text('Tentar novamente'),
      ),
    );
  }
}
