import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/movie.dart';
import '../../usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;
  MovieDetailBloc(this._getMovieDetail) : super(MovieDetailInitial()) {
    on<GetMovieDetailEvent>((event, emit) async {
      try {
        emit(MovieDetailLoading());
        final movie = await _getMovieDetail(event.id);
        emit(MovieDetailSuccess(movie));
      } on Exception catch (e) {
        emit(MovieDetailFailure(e.toString()));
      }
    });
  }
}
