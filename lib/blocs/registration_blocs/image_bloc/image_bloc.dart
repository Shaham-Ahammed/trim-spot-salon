import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc()
      : super(ImageInitial(
            LicenseInBytes: null,
            ProfileInBytes: null,
            ShopImageInBytes: null,
            LicensemagePath: "",
            ProfileImagePath: "",
            ShopImageImagePath: "")) {
    on<PickingShopLicense>(_shopLicesnsePicker);
    on<PickingProfile>(_profilePicker);
    on<PickingShopImage>(_shopImagePicker);
  }
  _shopLicesnsePicker(
      PickingShopLicense event, Emitter<ImageState> emit) async {
    final ImagePicker picker = ImagePicker();
    final licenseImage = await picker.pickImage(source: ImageSource.gallery);
    if (licenseImage != null) {
      emit(ImageInitial(
          LicenseInBytes: await licenseImage.readAsBytes(),
          ProfileInBytes: state.ProfileInBytes,
          ShopImageInBytes: state.ShopImageInBytes,
          LicensemagePath: licenseImage.name,
          ProfileImagePath: state.ProfileImagePath,
          ShopImageImagePath: state.ShopImageImagePath));
    }
  }

  _profilePicker(PickingProfile event, Emitter<ImageState> emit) async {
    final ImagePicker picker = ImagePicker();
    final profileImage = await picker.pickImage(source: ImageSource.gallery);
    if (profileImage != null) {
      emit(ImageInitial(
          LicensemagePath: state.LicensemagePath,
          ProfileImagePath: profileImage.name,
          ShopImageImagePath: state.ShopImageImagePath,
          LicenseInBytes: state.LicenseInBytes,
          ProfileInBytes: await profileImage.readAsBytes(),
          ShopImageInBytes: state.ShopImageInBytes));
    }
  }

  _shopImagePicker(PickingShopImage event, Emitter<ImageState> emit) async {
    final ImagePicker picker = ImagePicker();
    final shopImage = await picker.pickImage(source: ImageSource.gallery);
    if (shopImage != null) {
      emit(ImageInitial(
          LicenseInBytes: state.LicenseInBytes,
          ProfileInBytes: state.ProfileInBytes,
          ShopImageInBytes: await shopImage.readAsBytes(),
          LicensemagePath: state.LicensemagePath,
          ProfileImagePath: state.ProfileImagePath,
          ShopImageImagePath: shopImage.name));
    }
  }
}
