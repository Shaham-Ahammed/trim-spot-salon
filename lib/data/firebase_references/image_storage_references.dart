import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';

class FirebaseStorageReferences {
  firebase_storage.Reference shopImageReference(context) {
    firebase_storage.Reference shopImageReference = firebase_storage
        .FirebaseStorage.instance
        .ref('salon_registration_images/shop_image')
        .child(BlocProvider.of<ImageBloc>(context).state.ShopImageImagePath);
    return shopImageReference;
  }

  firebase_storage.Reference profileImageReference(context) {
    firebase_storage.Reference profileImageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('salon_registration_images/profile_image')
        .child(BlocProvider.of<ImageBloc>(context).state.ShopImageImagePath);
    return profileImageRef;
  }

  firebase_storage.Reference licenseImageReference(context) {
    firebase_storage.Reference licenseImageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('salon_registration_images/license_image')
        .child(BlocProvider.of<ImageBloc>(context).state.ShopImageImagePath);
    return licenseImageRef;
  }
}
