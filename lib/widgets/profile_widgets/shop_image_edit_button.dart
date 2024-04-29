

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class EditShopImageButton extends StatelessWidget {
  const EditShopImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Material(
        color: greyColor3,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
        child: InkWell(
          onTap: () {
            context
                .read<ProfileShopImageBloc>()
                .add(ProfilShopImageEditPressed());
          },
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
          child: Container(
            width: mediaqueryWidth(0.09, context),
            height: mediaqueryHeight(0.035, context),
            decoration: BoxDecoration(
                color: transparentColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12))),
            child: Icon(
              Icons.photo_camera_rounded,
              color: blackColor,
              size: mediaqueryHeight(0.023, context),
            ),
          ),
        ),
      ),
    );
  }
}