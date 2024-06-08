import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/data/repository/register_profile_to_firebase.dart';
import 'package:trim_spot_barber_side/screens/forget_pass_otp_screen.dart';
import 'package:trim_spot_barber_side/screens/otp_verification.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_barber_side/utils/snackbar.dart';
import 'package:trim_spot_barber_side/utils/otp_page/textedition_controller.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

class PhoneNumberAuthentication {
  static late String verficationId;
  sendOtp(context) async {
    final String phoneNumber =
        "+91${registrationPhoneController.text.toString()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar("too many requests. Try again later"));
        },
        codeSent: (String otpCode, int? resendToken) {
          verficationId = otpCode;
          Navigator.of(context).pushReplacement(
              FadeTransitionPageRoute(child: OtpVerificationScreen()));
        },
        codeAutoRetrievalTimeout: (String verificationid) {},
        phoneNumber: phoneNumber);
  }

  resendOTP(context) async {
    final String phoneNumber =
        "+91${registrationPhoneController.text.toString()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar("too many requests. Try again later"));
        },
        codeSent: (String otpCode, int? resendToken) {
          verficationId = otpCode;
        },
        codeAutoRetrievalTimeout: (String verificationid) {},
        phoneNumber: phoneNumber);
  }

  otpverificationAndDataAddingToFirebase(String verificationId, context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: registerOtpController.text.toString());
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      await RegisterProfileToFirebase().addDatasToFirebase(context);
    });
  }

  sendOtpFromForgetPassword(context) async {
    final String phoneNumber =
        "+91${forgotPasswordPhoneController.text.toString()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar("too many requests. Try again later"));
        },
        codeSent: (String otpCode, int? resendToken) {
          verficationId = otpCode;
          Navigator.of(context).pushReplacement(FadeTransitionPageRoute(
              child: ForgetPassOtpVerificationScreen()));
        },
        codeAutoRetrievalTimeout: (String verificationid) {},
        phoneNumber: phoneNumber);
  }

  resendOtpFromForgetPassword(context) async {
    final String phoneNumber =
        "+91${forgotPasswordPhoneController.text.toString()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar("too many requests. Try again later"));
        },
        codeSent: (String otpCode, int? resendToken) {
          verficationId = otpCode;
        },
        codeAutoRetrievalTimeout: (String verificationid) {},
        phoneNumber: phoneNumber);
  }
}
