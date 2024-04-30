// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/firebae_authentication/phone_number_validation.dart';
import 'package:trim_spot_barber_side/data/repository/unique_number.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';
import 'package:trim_spot_barber_side/utils/otp_page/formkey.dart';
import 'package:trim_spot_barber_side/utils/registration_page/form_key.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';
part 'register_button_event.dart';
part 'register_button_state.dart';

class RegisterButtonBloc
    extends Bloc<RegisterButtonEvent, RegisterButtonState> {
  RegisterButtonBloc() : super(RegisterButtonInitial(buttonPressed: false)) {
    on<RegisterButtonPressed>(_registerButtonPressed);
    on<OtpValidation>(_otpValidation);
    on<SubmitOtpButtonPressed>(_submitOtpButtonPressed);
  }
  _registerButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterButtonState> emit) async {
    emit(RegisterButtonInitial(buttonPressed: true));
    if ((registrationFormKey.currentState!.validate() &&
        locationValidation(event.context) &&
        shopImageValidation(event.context) &&
        profileValidation(event.context) &&
        closingTimeValidation(event.context) &&
        openingTimeValidation(event.context) &&
        shopServiceValidation(event.context) &&
        licenseValidation(event.context))) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError(buttonPressed: state.buttonPressed));
        return;
      }
      emit(LoadingState(buttonPressed: state.buttonPressed));
      add(OtpValidation(context: event.context));
    } else {
      print("registration failure");
      return;
    }
  }

  _otpValidation(OtpValidation event, Emitter<RegisterButtonState> emit) async {
    try {
      await PhoneNumberAuthentication().sendOtp(event.context);
    } catch (e) {
      emit(PhoneNumberAlreadyRegistered(buttonPressed: state.buttonPressed));
    }
  }

  _submitOtpButtonPressed(
      SubmitOtpButtonPressed event, Emitter<RegisterButtonState> emit) async {
    if (registerOtpFormKey.currentState!.validate()) {
      emit(LoadingState(buttonPressed: state.buttonPressed));
      try {
        await PhoneNumberAuthentication()
            .otpverificationAndDataAddingToFirebase(
                event.verificationId, event.context);
        await SharedPreferenceOperation()
            .setPhoneNumber(registrationPhoneController.text);
        uniquePhoneNumber = registrationPhoneController.text;
        emit(NavigateToRegisterSuccessPage(buttonPressed: state.buttonPressed));
      } catch (e) {
        emit(RegisrationFailure("error in verification",
            buttonPressed: state.buttonPressed));
        print("endhoo error und $e");
      }
    } else {
      return;
    }
  }
}
