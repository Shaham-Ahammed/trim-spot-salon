import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/shop_image/profile_shop_image_bloc.dart';

import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';

import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ShopManagementFunctions {
  bool checkAnyServicesSelected(BuildContext context) {
    final switches =
        BlocProvider.of<ShopManagementServiceBloc>(context, listen: false)
            .state
            .switches;
    bool anySelected = false;
    for (var selected in switches.values) {
      if (selected == true) {
        anySelected = true;
      }
    }
    return anySelected;
  }

  updatingShopImage(BuildContext context)async{
    
      if (!BlocProvider.of<ProfileShopImageBloc>(context, listen: false)
          .state
          .newShopImagePath
          .isEmpty) {
        final collection = await CollectionReferences().shopDetailsReference();
        final data = await UserDataDocumentFromFirebase().userDocument();
        final metadata =
            firebase_storage.SettableMetadata(contentType: 'image/jpeg');
        try {
          final shopImageref = firebase_storage.FirebaseStorage.instance
              .ref('salon_registration_images/shop_image')
              .child(BlocProvider.of<ProfileShopImageBloc>(context,
                      listen: false)
                  .state
                  .newShopImagePath);
          await shopImageref.putData(
              BlocProvider.of<ProfileShopImageBloc>(context,
                      listen: false)
                  .state
                  .newShopImageUnit8list!,
              metadata);
          final url = await shopImageref.getDownloadURL();
          collection.doc(data.id).update({SalonDocumentModel.shopImage: url});
        } catch (e) {
      
          return "something went wrong while adding shopImage $e";
        }
      }
  }
  List<String> servicesListArray(context) {
  final servicesMap =
      BlocProvider.of<ShopManagementServiceBloc>(context, listen: false)
          .state
          .switches;
  List<String> services = [];
  servicesMap.forEach((key, value) {
    if (value == true) {
      services.add(key);
    }
  });
  return services;
}

}
