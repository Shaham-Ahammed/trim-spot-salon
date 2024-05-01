import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/form_keys.dart';

part 'profile_password_event.dart';
part 'profile_password_state.dart';

class ProfilePasswordBloc
    extends Bloc<ProfilePasswordEvent, ProfilePasswordState> {
  ProfilePasswordBloc() : super(ProfilePasswordInitial()) {
    on<PressedSubmitButtonPressed>(_pressedSubmitButtonPressed);
  }
  _pressedSubmitButtonPressed(PressedSubmitButtonPressed event,
      Emitter<ProfilePasswordState> emit) async {
    if (profilePasswordKey.currentState!.validate()) {
      emit(PasswordUpdating());
      final collection = await CollectionReferences().shopDetailsReference();
      final user = await UserDataDocumentFromFirebase().userDocument();
      final userId = user.id;
      try {
        await collection.doc(userId).update(
            {SalonDocumentModel.password: profileNewPasswordController.text});
        emit(PasswordUpdated());
        return;
      } catch (e) {
        Navigator.pop(event.context);
        emit(ProfilePasswordInitial());
        print("error editing password");
      }
    } else {
      return;
    }
  }
}
