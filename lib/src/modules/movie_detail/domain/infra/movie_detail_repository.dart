import '../../models/movie.dart';

abstract interface class MovieDetailRepository {
  Future<Movie> getDetailMovie(int id);
}