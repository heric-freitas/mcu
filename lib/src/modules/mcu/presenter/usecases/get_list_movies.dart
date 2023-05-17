import '../../models/movies.dart';

abstract interface class GetListMovies {
  Future<List<Movies>> call();
}