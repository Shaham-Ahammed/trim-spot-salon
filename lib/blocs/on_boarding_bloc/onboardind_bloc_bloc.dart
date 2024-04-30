import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/login_key.dart';
part 'onboardind_bloc_event.dart';
part 'onboardind_bloc_state.dart';

class OnboardindBloc extends Bloc<OnboardindBlocEvent, OnboardindBlocState> {
  OnboardindBloc() : super(OnboardindBlocInitial()) {
    on<NextButtonPressed>(_nextButtonPressed);
    on<LoginButtonPressed>(_loginButtonPressed);
    on<SignUpButtonPressed>(_signUpButtonPressed);
  }
  _nextButtonPressed(
      NextButtonPressed event, Emitter<OnboardindBlocState> emit) async {
    if (event.page == 0) {
      emit(NavigateToSecondOnBoardingPage());
    } else if (event.page == 1) {
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.setBool(firstTimeUser, false);
      emit(NavigateToLoginOrSignupPage());
    }
  }

  _loginButtonPressed(
      LoginButtonPressed event, Emitter<OnboardindBlocState> emit) {
    emit(NavigateToLogin());
  }

  _signUpButtonPressed(
      SignUpButtonPressed event, Emitter<OnboardindBlocState> emit) {
    emit(NavigateToSignUp());
  }
}
