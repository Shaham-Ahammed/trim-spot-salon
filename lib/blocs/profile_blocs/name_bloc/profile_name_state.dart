part of 'profile_name_bloc.dart';

@immutable
sealed class ProfileNameState {
  final String name;
  final bool editPressed;
   
  ProfileNameState({required this.name, required this.editPressed});
  
}

final class ProfileNameInitial extends ProfileNameState {
  ProfileNameInitial({required super.name, required super.editPressed});
}
