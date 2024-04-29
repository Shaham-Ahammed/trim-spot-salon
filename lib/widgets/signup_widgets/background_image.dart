 import 'package:flutter/material.dart';

BoxDecoration backgroundImage() {
    return const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/splash barber blur.jpg")));
  }