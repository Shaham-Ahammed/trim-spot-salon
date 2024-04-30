part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsEvent {}

final class FetchingUserDetailsFromSplash extends UserDetailsEvent{}

final class ChangedProfile extends UserDetailsEvent{
  
}