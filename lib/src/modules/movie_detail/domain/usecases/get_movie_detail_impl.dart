import 'package:marvel/src/modules/movie_detail/domain/infra/movie_detail_repository.dart';
import 'package:marvel/src/modules/movie_detail/models/movie.dart';

import '../../presenter/usecases/get_movie_detail.dart';

class GetMovieDetailImpl implements GetMovieDetail {

  final MovieDetailRepository _detailRepository;

  GetMovieDetailImpl(this._detailRepository);

  @override
  Future<Movie> call(int id) async {
    return await _detailRepository.getDetailMovie(id);
  }

}