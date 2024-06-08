import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/updating_password.dart';
import 'package:trim_spot_barber_side/data/firebae_authentication/phone_number_validation.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/formkey.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<SendOtpButtonPressed>(_sendOtpButtonPressed);
    on<ResendOtpButtonPressed>(_resendOtpButtonPressed);
    on<SubmitOtpButtonPressed>(_submitOtpButtonPressed);
    on<SaveNewPasswordButtonPressed>(_saveNewPasswordButtonPressed);
  }

  _sendOtpButtonPressed(
      SendOtpButtonPressed event, Emitter<ForgetPasswordState> emit) async {
    if (forgotPasswordFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }
      emit(LoadingIndicatorOnForgotPassword());
      final isUserRegistered = await UpdatePasswordFunction().checkUserExists();
      if (!isUserRegistered) {
        emit(PhoneNumberNotRegistered());
        return;
      } else {
        await PhoneNumberAuthentication()
            .sendOtpFromForgetPassword(event.context);
      }
    } else {
      return;
    }
  }

  _resendOtpButtonPressed(
      ResendOtpButtonPressed event, Emitter<ForgetPasswordState> emit) {
    try {
      PhoneNumberAuthentication().resendOtpFromForgetPassword(event.context);
    } catch (e) {
      print("Error here $e");
    }
  }

  _submitOtpButtonPressed(
      SubmitOtpButtonPressed event, Emitter<ForgetPasswordState> emit) async {
    if (forgotPasswordOtpFieldFormKey.currentState!.validate()) {
      emit(LoadingIndicatorOnForgotPassword());
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId,
            smsCode: forgotPasswordOtpController.text.toString());
        await FirebaseAuth.instance.signInWithCredential(credential);
        emit(OtpVerfied());
      } catch (e) {
        emit(OtpVerificationFailed());
      }
    } else {
      return;
    }
  }

  _saveNewPasswordButtonPressed(SaveNewPasswordButtonPressed event,
      Emitter<ForgetPasswordState> emit) async {
    if (newPasswordFormKey.currentState!.validate()) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }
      emit(LoadingIndicatorOnForgotPassword());
      try {
        await UpdatePasswordFunction().updateNewPassword();
        emit(PasswordUpdationSuccessfull());
      } catch (e) {
        emit(PasswordUpdationFailed());
      }
    } else {
      return;
    }
  }
}
