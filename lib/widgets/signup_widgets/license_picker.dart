
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/error_displays_widgets/license_image_error.dart';

class ShopLicensePicker extends StatelessWidget {
  const ShopLicensePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child:  Container(
        height: mediaqueryHeight(0.25, context),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), bottomLeft: Radius.circular(14)),
            border: Border.all(color: cyanColor, width: 2)),
        child: Column(
          children: [
            SizedBox(
              height: mediaqueryHeight(0.015, context),
            ),
            myFont("Shop License",
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.019, context),
                fontWeight: FontWeight.w600,
                fontColor: greyColor2),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: mediaqueryHeight(0.02, context),
                    right: mediaqueryHeight(0.02, context),
                    bottom: mediaqueryHeight(0.04, context)),
                child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => context.read<ImageBloc>().add(PickingShopLicense()),
                    child: DottedBorder(
                        color: cyanColor,
                        child: Center(child: BlocBuilder<ImageBloc, ImageState>(
                            builder: (context, state) {
                          if (state is ImageInitial &&
                              state.LicensemagePath.isNotEmpty) {
                            return Container(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Image.memory(state.LicenseInBytes!,
                                  fit: BoxFit.cover),
                            );
                          }
                          return Icon(
                            Icons.document_scanner_outlined,
                            color: greyColor,
                             size: mediaqueryHeight(0.04, context),
                          );
                        }))),
                  ),
                ),
              ),
            ),
            LicenseImageError()
          ],
        ),
      ),
    );
  }
}
