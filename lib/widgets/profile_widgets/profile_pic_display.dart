
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/profile_pic_edit_button.dart';

class ProfilePictureDispaly extends StatelessWidget {
  const ProfilePictureDispaly({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: BlocBuilder<ProfileUserImageBloc, ProfileUserImageState>(
            builder: (context, state) {
              return CircleAvatar(
                  radius: mediaqueryWidth(0.17, context),
                  backgroundImage: state.newImagePath.isEmpty
                      ? NetworkImage(
                         state.originalProfilePic)
                      : MemoryImage(state.newProfileUnit8list!)
                          as ImageProvider);
            },
          ),
        ),
        profilePictureEditButton()
      ],
    );
  }
}
