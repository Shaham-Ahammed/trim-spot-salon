import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'eye_button_on_new_password_event.dart';
part 'eye_button_on_new_password_state.dart';

class EyeButtonOnNewPasswordBloc
    extends Bloc<EyeButtonOnNewPasswordEvent, EyeButtonOnNewPasswordState> {
  EyeButtonOnNewPasswordBloc()
      : super(EyeButtonOnNewPasswordInitial(isVisible: false)) {
    on<EyeButtonPressed>(_eyeButtonPressed);
  }
  _eyeButtonPressed(
      EyeButtonPressed event, Emitter<EyeButtonOnNewPasswordState> emit) {
    final bool change = !state.isVisible;
    emit(EyeButtonOnNewPasswordInitial(isVisible: change));
  }
}
