import 'package:flutter/material.dart';

BoxDecoration backgroundImage() {
    return const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/splash barber blur.jpg",
              ),
              fit: BoxFit.cover));
  }