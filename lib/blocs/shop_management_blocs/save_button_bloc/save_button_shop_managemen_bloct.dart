import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/models/shop_updation_model.dart';
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
    emit(ShopMangaementLoadingIndicator());
    final collectionreference =
        await CollectionReferences().shopDetailsReference();
    final data = await UserDataDocumentFromFirebase().userDocument();
    final newUpdates = ShopUpdationModel(
            shopName: data[SalonDocumentModel.shopName],
            shopImage: data[SalonDocumentModel.shopImage],
       //     services: data[SalonDocumentModel.services],
            occasionalClosures: BlocProvider.of<OccasionalClosureBloc>(
                    event.context,
                    listen: false)
                .state
                .holidaysIntimeStamp,
            parsedOpeningTime: BlocProvider.of<ShopManagementWorkingHoursBloc>(
                    event.context,
                    listen: false)
                .state
                .openTimeDisplayText,
            parsedClosingTime: BlocProvider.of<ShopManagementWorkingHoursBloc>(
                    event.context,
                    listen: false)
                .state
                .closingTimeDisplayText,
            holidays: BlocProvider.of<ShopManagementHolidayBloc>(event.context, listen: false)
                .state
                .holidays)
        .toMap();
       
    emit(ShopManagementSaveButtonStateInitial());
    try {
      await collectionreference.doc(data.id).update(newUpdates);
       Navigator.pop(event.context);
      emit(ShopManagementSaveButtonStateInitial());
    } catch (e) {
      print("error adichu $e");
    }
  }
}
