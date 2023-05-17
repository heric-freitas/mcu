import 'package:marvel/src/modules/movie_detail/models/movie.dart';

abstract interface class MovieDetailRepository {
  Future<Movie> getDetailMovie(int id);
}