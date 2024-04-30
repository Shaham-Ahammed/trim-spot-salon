import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';

part 'profile_shop_image_event.dart';
part 'profile_shop_image_state.dart';

class ProfileShopImageBloc
    extends Bloc<ProfileShopImageEvent, ProfileShopImageState> {
  ProfileShopImageBloc()
      : super(ProfileShopImageInitial(
            newShopImageUnit8list: null,
            newShopImagePath: '',
            originalShopPic: '')) {
    on<ProfilShopImageEditPressed>(_profilShopImageEditPressed);
    on<FetchShopImage>(_fetchShopImage);
  }
  _profilShopImageEditPressed(ProfilShopImageEditPressed event,
      Emitter<ProfileShopImageState> emit) async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ProfileShopImageInitial(
          newShopImageUnit8list: await image.readAsBytes(),
          newShopImagePath: image.name,
          originalShopPic: state.originalShopPic));
    }
  }

  _fetchShopImage(
      FetchShopImage event, Emitter<ProfileShopImageState> emit) async {
    final phone = await SharedPreferenceOperation().getPhoneNumber();
    final collection = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.phone, isEqualTo: phone)
        .get();
    final userData = collection.docs.first;
    emit(ProfileShopImageInitial(
        newShopImagePath: "",
        newShopImageUnit8list: null,
        originalShopPic: userData[SalonDocumentModel.shopImage]));
  }
}
