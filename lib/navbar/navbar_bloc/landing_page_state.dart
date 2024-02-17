part of 'landing_page_bloc.dart';

abstract class LandingPageState {
  int tabIndex;

  LandingPageState(this.tabIndex);
}

class LandingPageInitial extends LandingPageState {
  LandingPageInitial(super.tabIndex);
}
