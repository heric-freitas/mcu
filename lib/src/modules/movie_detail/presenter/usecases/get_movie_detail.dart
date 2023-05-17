import '../../models/movie.dart';

abstract interface class GetMovieDetail {
  Future<Movie> call(int id);
}