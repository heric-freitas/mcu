part of 'mcu_bloc.dart';

@immutable
sealed class McuState {}

class McuInitial extends McuState {}

class McuLoading extends McuState {}

class McuSuccess extends McuState {
  final List<Movies> movies;

  McuSuccess(this.movies);
}

class McuFailure extends McuState {
  final String message;

  McuFailure(this.message);
}
