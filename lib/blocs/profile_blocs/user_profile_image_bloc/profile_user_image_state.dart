part of 'profile_user_image_bloc.dart';

@immutable
sealed class ProfileUserImageState {
  final String profileImage;
  final String newImagePath;

  ProfileUserImageState({required this.profileImage, required this.newImagePath});
 
}

final class ProfileImageInitial extends ProfileUserImageState {
  ProfileImageInitial({required super.profileImage, required super.newImagePath});

}
