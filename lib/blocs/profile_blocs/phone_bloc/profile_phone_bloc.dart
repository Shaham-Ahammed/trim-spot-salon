import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_phone_event.dart';
part 'profile_phone_state.dart';

class ProfilePhoneBloc extends Bloc<ProfilePhoneEvent, ProfilePhoneState> {
  ProfilePhoneBloc()
      : super(ProfilePhoneInitial(editPressed: false,)) {
    on<ProfilPhoneEdit>(_profilePhoneEdit);
  }
  _profilePhoneEdit(ProfilPhoneEdit event, Emitter<ProfilePhoneState> emit) {
    emit(ProfilePhoneInitial( editPressed: event.editPressed));
  }
}
