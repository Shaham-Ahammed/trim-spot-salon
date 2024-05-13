import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/adding_image_to_firebase.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';
import 'package:trim_spot_barber_side/models/registration_model.dart';
import 'package:trim_spot_barber_side/utils/registration_page/service_convertion.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

class RegisterProfileToFirebase {
  final CollectionReference collection =
      CollectionReferences().shopDetailsReference();

  addDatasToFirebase(context) async {
    final profileImageUrl = await AddImageToFirebaseStorage()
        .addProfileImageToFirebaseStorage(context);
    final shopImageUrl =
        await AddImageToFirebaseStorage().shopImageToFirebaseStorage(context);
    final licenseImageUrl = await AddImageToFirebaseStorage()
        .licenseImageToFirebaseStorage(context);

    final data = RegistraitonModel(
      name: registrationNameController.text.trim(),
      email: registrationEmailController.text.trim(),
      holidays: BlocProvider.of<HolidayBloc>(context).state.holidays,
      parsedClosingTime: BlocProvider.of<WorkingHoursBloc>(context)
          .state
          .closingTimeDisplayText,
      parsedOpeningTime:
          BlocProvider.of<WorkingHoursBloc>(context).state.openTimeDisplayText,
      isApproved: false,
      password: registrationPasswordController.text,
      phone: registrationPhoneController.text,
      profileImage: profileImageUrl,
      shopImage: shopImageUrl,
      shopLicenseImage: licenseImageUrl,
      shopLocationLatLng: GeoPoint(
          BlocProvider.of<LocationBloc>(context).state.latLng.latitude,
          BlocProvider.of<LocationBloc>(context).state.latLng.longitude),
      shopLocationName:
          BlocProvider.of<LocationBloc>(context).state.address.split(",").first,
      shopName: registrationShopNameController.text.trim(),
      services: serviceToMapConversion(context),
      isRejected: false,
      occasionalClosures: [],
      servicesList: servicesListArray(context),
    ).toMap();
    try {
      DocumentReference docReference = await collection.add(data);
      await addingBookingsCollection(docReference);
    } catch (e) {
      print("error und $e");
    }
  }

  addingBookingsCollection(DocumentReference docReference) async {
    try {
      CollectionReference bookingCollectionRef = docReference
          .collection(FirebaseNamesShopSide.slotBookingCollectionReference);
      await bookingCollectionRef
          .doc(FirebaseNamesShopSide.slotsBookingDocument)
          .set({"dates": []});
    } catch (e) {
      print("error while creating collection $e");
    }
  }
}

List<String> servicesListArray(context) {
  final servicesMap =
      BlocProvider.of<ServiceBloc>(context, listen: false).state.switches;
  List<String> services = [];
  servicesMap.forEach((key, value) {
    if (value == true) {
      services.add(key);
    }
  });
  return services;
}
