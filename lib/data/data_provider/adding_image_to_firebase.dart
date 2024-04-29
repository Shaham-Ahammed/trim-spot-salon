import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/image_storage_references.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddImageToFirebaseStorage {
  final FirebaseStorageReferences storageReference =
      FirebaseStorageReferences();

  final metadata = firebase_storage.SettableMetadata(contentType: 'image/jpeg');

  Future<String> shopImageToFirebaseStorage(context) async {
    final imagesStoredBloc = BlocProvider.of<ImageBloc>(context).state;
    try {
      final shopImageReference =
          FirebaseStorageReferences().shopImageReference(context);
      await shopImageReference.putData(
          imagesStoredBloc.ShopImageInBytes!, metadata);
      return shopImageReference.getDownloadURL();
    } catch (e) {
      return "something went wrong while adding shopImage $e";
    }
  }

  Future<String> addProfileImageToFirebaseStorage(context) async {
    final imagesStoredBloc = BlocProvider.of<ImageBloc>(context).state;
    try {
      final profileImageReference =
          FirebaseStorageReferences().profileImageReference(context);
      await profileImageReference.putData(
          imagesStoredBloc.ProfileInBytes!, metadata);
      return profileImageReference.getDownloadURL();
    } catch (e) {
      return "something went wrong while adding profile Image $e";
    }
  }

  Future<String> licenseImageToFirebaseStorage(context) async {
    final imagesStoredBloc = BlocProvider.of<ImageBloc>(context).state;
    try {
      final licenseImageReference =
          FirebaseStorageReferences().licenseImageReference(context);
      await licenseImageReference.putData(
          imagesStoredBloc.LicenseInBytes!, metadata);
      return licenseImageReference.getDownloadURL();
    } catch (e) {
      return "something went wrong while adding license Image $e";
    }
  }
}
