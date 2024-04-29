import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_shop_image_event.dart';
part 'profile_shop_image_state.dart';

class ProfileShopImageBloc
    extends Bloc<ProfileShopImageEvent, ProfileShopImageState> {
  ProfileShopImageBloc()
      : super(ProfileShopImageInitial(
            ShopImage: "assets/images/s2.jpg", newShopImage: '')) {
    on<ProfilShopImageEditPressed>(_profilShopImageEditPressed);
  }
  _profilShopImageEditPressed(ProfilShopImageEditPressed event,
      Emitter<ProfileShopImageState> emit) async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ProfileShopImageInitial(
          ShopImage: state.ShopImage, newShopImage: image.path));
    }
  }
}
