// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ServiceRateTextFormField extends StatelessWidget {
  const ServiceRateTextFormField({
    Key? key,
    required this.rateController,
    required this.enabled,
  }) : super(key: key);
  final TextEditingController rateController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaqueryHeight(0.033, context),
        child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: enabled
              ? (value) {
                  if (value!.isEmpty) {
                    return "";
                  } else {
                    return null;
                  }
                }
              : (value) => null,
        
          controller: rateController,
          cursorColor: cyanColor,
          keyboardType: TextInputType.number,
          maxLength: 4,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
                     focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redErrorColor,width: 1)),
              errorStyle:
                  TextStyle(fontSize: mediaqueryHeight(0.0000000001, context)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:enabled? redErrorColor:greyColor,width: 1.5)),
              counterText: "",
              hintStyle: TextStyle(
                  fontFamily: balooChettan,
                  color: enabled ? blackColor : greyColor,
                  fontSize: 14),
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: enabled ? whiteColor : greyColor3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabled: enabled,
              disabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "rate"),
        ),
      ),
    );
  }
}
