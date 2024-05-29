import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/screens/profile.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';

class ProfileImageDisplay extends StatelessWidget {
  const ProfileImageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: mediaqueryHeight(0.05, context),
      backgroundImage:
          NetworkImage(context.watch<UserDetailsBloc>().state.profileImage),
    );
  }
}

class ProfileImageEditButton extends StatelessWidget {
  const ProfileImageEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: Material(
          borderRadius: BorderRadius.circular(90),
          color: cyanColor,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(FadeTransitionPageRoute(child: ProfileScreen()));
            },
            borderRadius: BorderRadius.circular(90),
            child: Container(
              padding: EdgeInsets.all(mediaqueryHeight(0.007, context)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                size: mediaqueryHeight(0.02, context),
              ),
            ),
          ),
        ));
  }
}
