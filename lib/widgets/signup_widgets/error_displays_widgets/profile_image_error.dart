
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';

class ProfileImageError extends StatelessWidget {
  const ProfileImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
     builder: (context, state) {
       if (state.ProfileImagePath.isEmpty  && registerbuttonPressed(context)
         ) {
         return Align(
           alignment: Alignment.topLeft,
           child: Padding(
             padding: EdgeInsets.only(
                 left: mediaqueryHeight(0.02, context),
                 top: mediaqueryHeight(0.007, context)),
             child: Text(
               "upload profile",
               style: TextStyle(
                 color: Colors.red.shade800,
                 fontSize: 13.0,
               ),
             ),
           ),
         );
       }
       return Container();
     },
          );
  }
}
