import '../../models/movies.dart';

abstract interface class McuRepository {
  Future<List<Movies>> getListMovies();
}