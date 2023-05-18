import 'dart:developer';

import '../../domain/infra/movie_detail_repository.dart';
import '../../models/movie.dart';
import '../datasources/movie_detail_datasource.dart';

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