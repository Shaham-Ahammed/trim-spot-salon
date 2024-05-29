// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ServiceTimeTextFormField extends StatelessWidget {
  const ServiceTimeTextFormField({
    Key? key,
    required this.timeController,
    required this.enabled,
  }) : super(key: key);
  final TextEditingController timeController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaqueryHeight(0.033, context),
        child: TextFormField(
          style: TextStyle(fontSize: mediaqueryHeight(0.023, context)),
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
          controller: timeController,
          keyboardType: TextInputType.number,
          inputFormatters:[ FilteringTextInputFormatter.digitsOnly],
          maxLength: 3,
            cursorHeight: mediaqueryHeight(0.03, context),
          cursorColor: cyanColor,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redErrorColor)),
              errorStyle:
                  TextStyle(fontSize: mediaqueryHeight(0.0000000001, context)),
              errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(color:enabled? redErrorColor:greyColor,width: 1.5)),
              counterText: "",
              hintStyle: TextStyle(
                  fontFamily: balooChettan,
                  color: enabled ? blackColor : greyColor,
                 fontSize: mediaqueryHeight(0.018, context),),
              filled: true,
              fillColor: enabled ? whiteColor : greyColor3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabled: enabled,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              disabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "min"),
        ),
      ),
    );
  }
}
