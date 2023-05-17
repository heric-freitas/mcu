import 'package:bloc/bloc.dart';
import 'package:marvel/src/modules/mcu/models/movies.dart';
import 'package:marvel/src/modules/mcu/presenter/usecases/get_list_movies.dart';
import 'package:meta/meta.dart';

part 'mcu_event.dart';
part 'mcu_state.dart';

class McuBloc extends Bloc<McuEvent, McuState> {
  final GetListMovies _getListMovies;
  McuBloc(this._getListMovies) : super(McuInitial()) {
    on<GetMovies>((event, emit) async {
      try {
        emit(McuLoading());
        final listMovies = await _getListMovies();
        emit(McuSuccess(listMovies));
      } on Exception catch (e) {
        emit(McuFailure(e.toString()));
      }
    });
  }
}
