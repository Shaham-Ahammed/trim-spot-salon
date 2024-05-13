import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';

import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';
import 'package:trim_spot_barber_side/utils/login_page/login_screen_constants.dart';

import 'package:trim_spot_barber_side/utils/login_page/form_key.dart';

part 'login_validation_event.dart';
part 'login_validation_state.dart';

class LoginValidationBloc
    extends Bloc<LoginValidationEvent, LoginValidationState> {
  LoginValidationBloc() : super(LoginValidationInitial()) {
    on<LoginbuttonPressed>(_loginButtonPressed);
  }
  _loginButtonPressed(
      LoginbuttonPressed event, Emitter<LoginValidationState> emit) async {
    if (loginFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }
      emit(LoginLoadingState());
      final QuerySnapshot shopDetailsCollection = await CollectionReferences()
          .shopDetailsReference()
          .where("phone", isEqualTo: loginPhoneController.text)
          .get();
      if (shopDetailsCollection.docs.isEmpty) {
        emit(LoginFailure("user not registered"));
        return;
      } else {
        final data = shopDetailsCollection.docs.first;
        final password = data['password'];
        if (password == loginPasswordController.text) {
          await SharedPreferenceOperation()
              .setPhoneNumber(loginPhoneController.text);
         
          emit(LoginSuccess());
        } else {
          emit(LoginFailure("incorrect password"));
        }
      }
    } else {
      return;
    }
  }
}
