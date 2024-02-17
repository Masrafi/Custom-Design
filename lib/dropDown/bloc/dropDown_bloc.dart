import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/repo.dart';
import 'dropDown_event.dart';
import 'dropDown_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  final DropDownRepo _repository;

  DropDownBloc(this._repository) : super(DropDownLoadingState()) {
    on<DropDownLoadEvent>((event, emit) async {
      emit(DropDownLoadingState());
      try {
        print('.............................................. bloc error');
        final user = await _repository.dataShowFetch();
        print('bloc $user');
        emit(DropDownLoadedState(user));
        // user.fold(
        // (failure) => DropDownErrorState('Error'),
        // (user) => emit(DropDownLoadedState( user)));
      } catch (e) {
        print('e: $e');
        emit(DropDownErrorState(e.toString()));
      }
    });
  }
}
