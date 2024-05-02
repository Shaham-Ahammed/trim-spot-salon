import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

import 'package:trim_spot_barber_side/data/shared_preference_operations/login_key.dart';
import 'package:trim_spot_barber_side/screens/bottom_navigation.dart';
import 'package:trim_spot_barber_side/screens/login.dart';
import 'package:trim_spot_barber_side/screens/login_or_signup.dart';
import 'package:trim_spot_barber_side/screens/onboarding_screen.dart';
import 'package:trim_spot_barber_side/screens/registration_failed.dart';
import 'package:trim_spot_barber_side/screens/registration_successful.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';

checkTheScreen(context) async {
  await Future.delayed(Duration(milliseconds: 2500));
  final sharedPreferences = await SharedPreferences.getInstance();
  final bool? userStatus = sharedPreferences.getBool(firstTimeUser);

  if (userStatus == null) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FirstIntroductionPage(),
    ));
    return;
  }

  final String? loginNumber = sharedPreferences.getString(loggedInNumber);

  if (loginNumber == null) {
    Navigator.of(context)
        .pushReplacement(FadeTransitionPageRoute(child: LoginOrSignup()));
    return;
  } else if (loginNumber.isEmpty) {
    Navigator.of(context)
        .pushReplacement(FadeTransitionPageRoute(child: LoginScreen()));
    return;
  } else {
    checkTheRegistrationStatus(loginNumber, context);
  }
}

checkTheRegistrationStatus(String loginNumber, context) async {
  final shopCollection = await CollectionReferences().shopDetailsReference();
  final data = await shopCollection
      .where(SalonDocumentModel.phone, isEqualTo: loginNumber)
      .get();
  if (data.docs.isNotEmpty) {
    final userData = data.docs.first;
    if (userData[SalonDocumentModel.isApproved]) {
      Navigator.of(context).pushReplacement(
          FadeTransitionPageRoute(child: BottomNavigationScreen()));
      return;
    } else if (userData[SalonDocumentModel.isRejected]) {
      Navigator.of(context).pushReplacement(
          FadeTransitionPageRoute(child: RegistrationFailedMessageScreen()));
      return;
    } else if (!userData[SalonDocumentModel.isApproved]) {
      Navigator.of(context).pushReplacement(FadeTransitionPageRoute(
          child: RegistrationSuccessfulMessageScreen()));
      return;
    }
  }
}
