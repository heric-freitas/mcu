import 'package:bloc/bloc.dart';
import 'package:marvel/src/modules/movie_detail/models/movie.dart';
import 'package:marvel/src/modules/movie_detail/presenter/usecases/get_movie_detail.dart';
import 'package:meta/meta.dart';

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
