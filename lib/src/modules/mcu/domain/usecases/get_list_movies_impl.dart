import '../../models/movies.dart';
import '../../presenter/usecases/get_list_movies.dart';
import '../infra/mcu_repository.dart';

class GetListMoviesImpl implements GetListMovies {
  final McuRepository _infra;

  GetListMoviesImpl(this._infra);

  @override
  Future<List<Movies>> call() async {
    return await _infra.getListMovies();
  }
}
