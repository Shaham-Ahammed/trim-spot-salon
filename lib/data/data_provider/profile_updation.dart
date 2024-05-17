import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileUpdation {
  changingProfilePicture(
      {required BuildContext context,
      required QueryDocumentSnapshot<Object?> data,
      required CollectionReference<Object?> collection}) async {
    if (!BlocProvider.of<ProfileUserImageBloc>(context, listen: false)
        .state
        .newImagePath
        .isEmpty) {
      final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');
      try {
        final profileImageRef = firebase_storage.FirebaseStorage.instance
            .ref('salon_registration_images/profile_image')
            .child(BlocProvider.of<ProfileUserImageBloc>(context, listen: false)
                .state
                .newImagePath);
        await profileImageRef.putData(
            BlocProvider.of<ProfileUserImageBloc>(context, listen: false)
                .state
                .newProfileUnit8list!,
            metadata);
        final url = await profileImageRef.getDownloadURL();
        collection.doc(data.id).update({SalonDocumentModel.profileImage: url});
      } catch (e) {
        return "something went wrong while adding shopImage $e";
      }
    }
  }
}
