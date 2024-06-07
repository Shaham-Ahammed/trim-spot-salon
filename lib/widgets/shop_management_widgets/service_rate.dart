// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ShopManagementServiceRateTextFormField extends StatefulWidget {
  const ShopManagementServiceRateTextFormField({
    Key? key,
    required this.rateController,
    required this.enabled,
  }) : super(key: key);
  final TextEditingController rateController;
  final bool enabled;

  @override
  State<ShopManagementServiceRateTextFormField> createState() =>
      _ShopManagementServiceRateTextFormFieldState();
}

class _ShopManagementServiceRateTextFormFieldState
    extends State<ShopManagementServiceRateTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: mediaqueryHeight(0.033, context),
        child: TextFormField(
          style: TextStyle(fontSize: mediaqueryHeight(0.023, context)),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.enabled
              ? (value) {
                  if (value!.isEmpty) {
                    return "";
                  } else {
                    return null;
                  }
                }
              : (value) => null,
          controller: widget.rateController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                  borderSide: BorderSide(
                      color: widget.enabled ? redErrorColor : greyColor,
                      width: 1.5)),
              counterText: "",
              hintStyle: TextStyle(
                fontFamily: balooChettan,
                color: widget.enabled ? blackColor : greyColor,
                fontSize: mediaqueryHeight(0.018, context),
              ),
              filled: true,
              fillColor: widget.enabled ? whiteColor : greyColor3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              enabled: widget.enabled,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              disabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: cyanColor)),
              hintText: "rate"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.rateController.clear();
    super.dispose();
  }
}
