import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/shop_management/confirm_changes_text.dart';

Future<dynamic> saveChangesAlert(
  BuildContext parentCtx,
) {
  return showDialog(
      barrierColor: Color.fromARGB(187, 0, 0, 0),
      context: parentCtx,
      builder: (context) {
        return Dialog(
          child: Container(
            width: mediaqueryHeight(0.8, context),
            height: mediaqueryHeight(0.33, context),
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade400,
              border: Border.all(color: greyColor, width: 2),
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
            child: Column(
              children: [
                myFont("Confirm Changes ?",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.0245, context),
                    fontWeight: FontWeight.w500,
                    fontColor: cyanColor),
                SizedBox(height: mediaqueryHeight(0.003, context)),
                Container(
                  height: 1,
                  width: mediaqueryWidth(0.45, context),
                  color: greyColor,
                ),
                SizedBox(height: mediaqueryHeight(0.023, context)),
                Text(
                  saveChangesText,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.016, context),
                      fontWeight: FontWeight.w400,
                      color: whiteColor),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: myFont("NO",
                            fontFamily: cabinCondensed,
                            fontSize: mediaqueryHeight(0.024, context),
                            fontWeight: FontWeight.w500,
                            fontColor: greyColor)),
                    Container(
                      height: mediaqueryHeight(0.03, context),
                      width: 1,
                      color: greyColor,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<ShopManagementSaveButtonBloc>().add(
                              SaveChangesButtonPressed(context: parentCtx));
                        },
                        child: myFont("YES",
                            fontFamily: cabinCondensed,
                            fontSize: mediaqueryHeight(0.024, context),
                            fontWeight: FontWeight.w500,
                            fontColor: cyanColor)),
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight(0.015, context),
                )
              ],
            ),
          ),
        );
      });
}
