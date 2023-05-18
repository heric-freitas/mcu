import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/mixins/loader.dart';
import 'presenter/controllers/bloc/mcu_bloc.dart';
import 'ui/mcu_page.dart';
import 'package:provider/provider.dart';

import 'data/datasource/mcu_datasource_impl.dart';
import 'domain/infra/mcu_repository.dart';
import 'domain/usecases/get_list_movies_impl.dart';
import 'infra/datasources/mcu_datasources.dart';
import 'infra/repository/mcu_repository_impl.dart';
import 'presenter/usecases/get_list_movies.dart';

class McuProvider extends StatefulWidget {
  const McuProvider({super.key});

  @override
  State<McuProvider> createState() => _McuProviderState();
}

class _McuProviderState extends State<McuProvider> with Loader {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<McuDatasource>(
          create: (context) => McuDatasourceImpl(),
        ),
        RepositoryProvider<McuRepository>(
          create: (context) => McuRepositoryImpl(context.read<McuDatasource>()),
        ),
        RepositoryProvider<GetListMovies>(
          create: (context) => GetListMoviesImpl(context.read<McuRepository>()),
        ),
        BlocProvider(
          create: (context) => McuBloc(context.read<GetListMovies>()),
        ),
      ],
      child: const McuPage(),
    );
  }
}
