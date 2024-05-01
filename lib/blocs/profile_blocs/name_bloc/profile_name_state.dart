part of 'profile_name_bloc.dart';

@immutable
sealed class ProfileNameState {

  final bool editPressed;
   
  ProfileNameState({ required this.editPressed});
  
}

final class ProfileNameInitial extends ProfileNameState {
  ProfileNameInitial({ required super.editPressed});
}
