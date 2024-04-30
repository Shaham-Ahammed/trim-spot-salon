import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';

part 'profile_user_image_event.dart';
part 'profile_user_image_state.dart';

class ProfileUserImageBloc
    extends Bloc<ProfileUserImageEvent, ProfileUserImageState> {
  ProfileUserImageBloc()
      : super(ProfileImageInitial(
            newProfileUnit8list: null,
            newImagePath: '',
            originalProfilePic: '')) {
    on<ProfilImageEditPressed>(_profileImageEditPressed);
    on<FetchUserProfileImage>(_fetchUserProfileImage);
  }
  _profileImageEditPressed(
      ProfilImageEditPressed event, Emitter<ProfileUserImageState> emit) async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ProfileImageInitial(
          newImagePath: image.name,
          newProfileUnit8list: await image.readAsBytes(),
          originalProfilePic: state.originalProfilePic));
    }
  }

  _fetchUserProfileImage(
      FetchUserProfileImage event, Emitter<ProfileUserImageState> emit) async {
    final phone = await SharedPreferenceOperation().getPhoneNumber();
    final collection = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.phone, isEqualTo: phone)
        .get();
    final userData = collection.docs.first;
    emit(ProfileImageInitial(
        newProfileUnit8list: null,
        newImagePath: "",
        originalProfilePic: userData[SalonDocumentModel.profileImage]));
  }
}
