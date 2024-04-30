import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
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
                color: greyColor3,
                width: double.infinity,
                height: mediaqueryHeight(0.25, context),
                child: state.newShopImagePath.isEmpty
                    ? Image.network(
                        errorBuilder: (context, error, stackTrace) {
                          return Container();
                        },
                        state.originalShopPic,
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        state.newShopImageUnit8list!,
                        fit: BoxFit.cover,
                      )),
            EditShopImageButton(),
          ],
        );
      },
    );
  }
}
