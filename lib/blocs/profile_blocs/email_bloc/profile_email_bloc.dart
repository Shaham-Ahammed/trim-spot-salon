import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_email_event.dart';
part 'profile_email_state.dart';

class ProfileEmailBloc extends Bloc<ProfileEmailEvent, ProfileEmailState> {
  ProfileEmailBloc()
      : super(
            ProfileEmailInitial( editPressed: false)) {
    on<EmailEditButtonPressed>(_emailEditButtonPressed);
  }
  _emailEditButtonPressed(
      EmailEditButtonPressed event, Emitter<ProfileEmailState> emit) {
    emit(ProfileEmailInitial(
       editPressed: event.editPressed));
  }
}
