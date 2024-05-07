import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/models/shop_updation_model.dart';
import 'package:trim_spot_barber_side/utils/shop_management/formkey_services.dart';
import 'package:trim_spot_barber_side/utils/shop_management/service_to_map_conversion.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'save_button_shop_managemen_event.dart';
part 'save_button_shop_managemen_state.dart';

class ShopManagementSaveButtonBloc
    extends Bloc<ShopManagementSaveButtonEvent, ShopManagementSaveButtonState> {
  ShopManagementSaveButtonBloc()
      : super(ShopManagementSaveButtonStateInitial()) {
    on<SaveChangesButtonPressed>(_saveChangesButtonPressed);
  }
  _saveChangesButtonPressed(SaveChangesButtonPressed event,
      Emitter<ShopManagementSaveButtonState> emit) async {
    if (shopManagementFormKeyForServices.currentState!.validate()) {
      final switches = BlocProvider.of<ShopManagementServiceBloc>(event.context,
              listen: false)
          .state
          .switches;
      bool anySelected = false;
      for (var selected in switches.values) {
        if (selected == true) {
          anySelected = true;
        }
      }
      if (!anySelected) {
        emit(ErrorInUpdation("please select atleast one service"));
        return;
      }
   
      emit(ShopMangaementLoadingIndicator());
      if (!BlocProvider.of<ProfileShopImageBloc>(event.context, listen: false)
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
              .child(BlocProvider.of<ProfileShopImageBloc>(event.context,
                      listen: false)
                  .state
                  .newShopImagePath);
          await shopImageref.putData(
              BlocProvider.of<ProfileShopImageBloc>(event.context,
                      listen: false)
                  .state
                  .newShopImageUnit8list!,
              metadata);
          final url = await shopImageref.getDownloadURL();
          collection.doc(data.id).update({SalonDocumentModel.shopImage: url});
        } catch (e) {
          emit(ErrorInUpdation("error while updating the shop iamge"));
          return "something went wrong while adding shopImage $e";
        }
      }
      final collectionreference =
          await CollectionReferences().shopDetailsReference();
      final data = await UserDataDocumentFromFirebase().userDocument();
      final newUpdates = ShopUpdationModel(
              shopImage: data[SalonDocumentModel.shopImage],
              services: serviceToMapConversionInShopManagement(event.context),
              occasionalClosures: BlocProvider.of<OccasionalClosureBloc>(
                      event.context,
                      listen: false)
                  .state
                  .holidaysIntimeStamp,
              parsedOpeningTime:
                  BlocProvider.of<ShopManagementWorkingHoursBloc>(event.context,
                          listen: false)
                      .state
                      .openTimeDisplayText,
              parsedClosingTime:
                  BlocProvider.of<ShopManagementWorkingHoursBloc>(event.context,
                          listen: false)
                      .state
                      .closingTimeDisplayText,
              holidays: BlocProvider.of<ShopManagementHolidayBloc>(
                      event.context,
                      listen: false)
                  .state
                  .holidays)
          .toMap();

      emit(ShopManagementSaveButtonStateInitial());
      try {
        await collectionreference.doc(data.id).update(newUpdates);
        Navigator.pop(event.context);
        emit(ShopManagementSaveButtonStateInitial());
      } catch (e) {
        Navigator.pop(event.context);
        emit(ErrorInUpdation("error while updating. please try again"));
        print("error adichu $e");
      }
    } else {
      emit(ErrorInUpdation("some service details are not provided"));
      return;
    }
  }
}
