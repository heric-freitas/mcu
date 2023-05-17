import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/src/modules/movie_detail/domain/usecases/get_movie_detail_impl.dart';
import 'package:marvel/src/modules/movie_detail/infra/datasources/movie_detail_datasource.dart';
import 'package:marvel/src/modules/movie_detail/presenter/usecases/get_movie_detail.dart';
import 'package:provider/provider.dart';

import 'data/datasource/movie_detail_datasource_impl.dart';
import 'domain/infra/movie_detail_repository.dart';
import 'infra/repository/movie_detail_repository_impl.dart';
import 'presenter/controllers/bloc/movie_detail_bloc.dart';
import 'ui/movie_detail_page.dart';

class MovieDetailProvider extends StatefulWidget {
  final int id;
  const MovieDetailProvider({super.key, required this.id});

  @override
  State<MovieDetailProvider> createState() => _MovieDetailProviderState();
}

class _MovieDetailProviderState extends State<MovieDetailProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<MovieDetailDatasource>(create: (context) => MovieDetailDatasourceImpl(),),
        RepositoryProvider<MovieDetailRepository>(create: (context) => MovieDetailRepositoryImpl(context.read<MovieDetailDatasource>()),),
        RepositoryProvider<GetMovieDetail>(create: (context) => GetMovieDetailImpl(context.read<MovieDetailRepository>()),),
        BlocProvider(create: (context) => MovieDetailBloc(context.read<GetMovieDetail>()),),
      ],
      child: MovieDetailPage(id: widget.id),
    );
  }
}