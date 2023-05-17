import 'dart:developer';

import 'package:marvel/src/modules/movie_detail/infra/datasources/movie_detail_datasource.dart';
import 'package:marvel/src/modules/movie_detail/models/movie.dart';

import '../../domain/infra/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDatasource _movieDetailDatasource;

  MovieDetailRepositoryImpl(this._movieDetailDatasource);
  @override
  Future<Movie> getDetailMovie(int id) async {
    try {
      final movie = await _movieDetailDatasource.getDetailMovie(id);
      return Movie.fromMap(movie);
    } on Exception catch (e, s) {
      log('Erro no MovieDetailRepositoryImpl', error: e, stackTrace: s);
      throw Exception('Erro no MovieDetailRepositoryImpl');
    }
  }
}