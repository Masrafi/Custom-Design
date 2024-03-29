import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial(0)) {
    on<LandingPageEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(LandingPageInitial(event.tabIndex));
      }
    });
  }
}
