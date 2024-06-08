import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

class ResendOtpWidgetsForgetPassword extends StatefulWidget {
  const ResendOtpWidgetsForgetPassword({
    super.key,
  });

  @override
  State<ResendOtpWidgetsForgetPassword> createState() => _ResendOtpTextState();
}

class _ResendOtpTextState extends State<ResendOtpWidgetsForgetPassword> {
  int _counter = 120;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "did not recieve OTP? Resend OTP in \n $_counter seconds",
          textAlign: TextAlign.center,
          style: TextStyle(
              overflow: null,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.016, context),
              fontWeight: FontWeight.w500,
              color: whiteColor),
        ),
        SizedBox(
          height: mediaqueryHeight(0.023, context),
        ),
        submitButtonCyan(context,
            text: "Resend OTP",
            buttonColor: _counter == 0 ? Colors.blue.shade200 : greyColor3,
            fontSize: mediaqueryHeight(0.016, context),
            fontColor: _counter == 0 ? blackColor : greyColor,
            heigh: mediaqueryHeight(0.03, context),
            width: mediaqueryWidth(0.3, context), function: () {
          if (_counter == 0) {
            context
                .read<ForgetPasswordBloc>()
                .add(ResendOtpButtonPressed(context: context));
            setState(() {
              _counter = 120;
            });
            _startTimer();
          }
          return null;
        })
      ],
    );
  }
}
