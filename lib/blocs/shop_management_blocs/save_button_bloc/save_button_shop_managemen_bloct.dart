import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/save_button_shop_management_functions.dart';
import 'package:trim_spot_barber_side/data/data_provider/shop_management.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/models/shop_updation_model.dart';
import 'package:trim_spot_barber_side/utils/shop_management/formkey_services.dart';
import 'package:trim_spot_barber_side/utils/shop_management/service_to_map_conversion.dart';

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
      final anyServiceSelected =
          ShopManagementFunctions().checkAnyServicesSelected(event.context);
      if (!anyServiceSelected) {
        emit(ErrorInUpdation("please select atleast one service"));
        return;
      }

      emit(ShopMangaementLoadingIndicator());

      final data = await UserDataDocumentFromFirebase().userDocument();

      List<String> firebaseOccasionalHolidays =
          (data[SalonDocumentModel.occasionalClosures] as List<dynamic>)
              .cast<String>();
      final currentOccasionalClosures =
          BlocProvider.of<OccasionalClosureBloc>(event.context, listen: false)
              .state
              .occasionalHolidays;
      if (firebaseOccasionalHolidays != currentOccasionalClosures &&
          currentOccasionalClosures.isNotEmpty) {
        await HandlingOccasionalClosures()
            .changingThePendingToCancelledInUserSide(
                event.context, currentOccasionalClosures);

        await HandlingOccasionalClosures().removingAllBookedSlotsFromSlotList(
            event.context, currentOccasionalClosures);

        await HandlingOccasionalClosures()
            .deleteAllPendingsFromShopSideOnThatDay(
                event.context, currentOccasionalClosures);
      }

      try {
        await ShopManagementFunctions().updatingShopImage(event.context);
      } catch (e) {
        emit(ErrorInUpdation("error while updating the shop iamge"));
      }

      final collectionreference =
          await CollectionReferences().shopDetailsReference();

      final newUpdates = ShopUpdationModel(
             
              services: serviceToMapConversionInShopManagement(event.context),
              occasionalClosures: BlocProvider.of<OccasionalClosureBloc>(
                      event.context,
                      listen: false)
                  .state
                  .occasionalHolidays,
              servicesList:
                  ShopManagementFunctions().servicesListArray(event.context))
          .toMap();

      emit(ShopManagementSaveButtonStateInitial());
      try {
        await collectionreference.doc(data.id).update(newUpdates);
      } catch (e) {
        Navigator.pop(event.context);
        emit(ErrorInUpdation("error while updating. please try again"));
        print("error adichu $e");
      }
    } else {
      emit(ErrorInUpdation("some service details are not provided"));
      return;
    }
    emit(UpdationSuccessfull());
  }
}
