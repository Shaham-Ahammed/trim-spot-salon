import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/profile_updation.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_barber_side/utils/profile_screen/form_keys.dart';
part 'profile_save_button_event.dart';
part 'profile_save_button_state.dart';

class ProfileSaveButtonBloc
    extends Bloc<ProfileSaveButtonEvent, ProfileSaveButtonState> {
  ProfileSaveButtonBloc() : super(ProfileSaveButtonInitial()) {
    on<ProfileSaveButtonPressed>(_profileSaveButtonPressed);
  }
  _profileSaveButtonPressed(ProfileSaveButtonPressed event,
      Emitter<ProfileSaveButtonState> emit) async {
    if (profileFormKey.currentState!.validate()) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectionState.none)) {
        emit(NetworkErrorWhileUpdatingProfile());
        return;
      }

      emit(ProfileUpdating());
      final collection = await CollectionReferences().shopDetailsReference();
      final data = await UserDataDocumentFromFirebase().userDocument();
      try {
        await ProfileUpdation().changingProfilePicture(
            context: event.context, data: data, collection: collection);
      } catch (e) {
        Navigator.pop(event.context);
      }

      if (BlocProvider.of<ProfileNameBloc>(event.context, listen: false)
              .state
              .editPressed ==
          true) {
        collection.doc(data.id).update(
            {SalonDocumentModel.name: profileNameController.text.trim()});
      }
      if (BlocProvider.of<ProfileEmailBloc>(event.context, listen: false)
              .state
              .editPressed ==
          true) {
        collection.doc(data.id).update(
            {SalonDocumentModel.email: profileEmailController.text.trim()});
      }

      Navigator.pop(event.context);
      emit(ProfileUpdationFinished());
    } else {
      return;
    }
  }
}
