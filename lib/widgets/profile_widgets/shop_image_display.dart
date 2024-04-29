import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_edit_button.dart';


class ShopImageDisplay extends StatelessWidget {
  const ShopImageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileShopImageBloc, ProfileShopImageState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: mediaqueryHeight(0.25, context),
              child: state.newShopImage.isEmpty
                  ? Image(
                      image: AssetImage("assets/images/s1.jpg"),
                      fit: BoxFit.cover,
                    )
                  : Image(
                      fit: BoxFit.cover,
                      image: FileImage(File(state.newShopImage))),
            ),
            EditShopImageButton(),
          ],
        );
      },
    );
  }
}
