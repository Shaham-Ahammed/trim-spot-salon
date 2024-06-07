import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/formkey.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<SendOtpButtonPressed>(_sendOtpButtonPressed);
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
      final phoneNumber = forgotPasswordPhoneController.text;

      final collection =
          await CollectionReferences().shopDetailsReference().get();

      final docs = collection.docs;

      final List<QueryDocumentSnapshot<Object?>> documents = [];
      for (var doc in docs) {
        if (doc[SalonDocumentModel.phone] == phoneNumber) {
          documents.add(doc);
          break;
        }
      }
      if (documents.isEmpty) {
        emit(PhoneNumberNotRegistered());
        return;
      } else {
        emit(NavigateToVerfiyOtpPage());

        final userDocument = documents.first;
      }
    } else {
      return;
    }
  }
}
