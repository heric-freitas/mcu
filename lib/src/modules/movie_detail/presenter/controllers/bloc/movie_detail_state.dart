part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final Movie movie;

  MovieDetailSuccess(this.movie);
}

class MovieDetailFailure extends MovieDetailState {
  final String message;

  MovieDetailFailure(this.message);
}
