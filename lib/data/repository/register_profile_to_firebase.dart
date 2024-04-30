import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/adding_image_to_firebase.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/models/registration_model.dart';
import 'package:trim_spot_barber_side/utils/registration_page/service_convertion.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

class RegisterProfileToFirebase {
  addDatasToFirebase(context) async {
    final profileImageUrl = await AddImageToFirebaseStorage()
        .addProfileImageToFirebaseStorage(context);
    final shopImageUrl =
        await AddImageToFirebaseStorage().shopImageToFirebaseStorage(context);
    final licenseImageUrl = await AddImageToFirebaseStorage()
        .licenseImageToFirebaseStorage(context);

    final CollectionReference collection =
        CollectionReferences().shopDetailsReference();

    final data = RegistraitonModel(
        name: registrationNameController.text.trim(),
        closingTime:
            BlocProvider.of<WorkingHoursBloc>(context).state.closingTime!,
        email: registrationEmailController.text.trim(),
        openingTime:
            BlocProvider.of<WorkingHoursBloc>(context).state.openingTime!,
        holidays: BlocProvider.of<HolidayBloc>(context).state.holidays,
        parsedClosingTime: BlocProvider.of<WorkingHoursBloc>(context)
            .state
            .closingTimeDisplayText,
        parsedOpeningTime: BlocProvider.of<WorkingHoursBloc>(context)
            .state
            .openTimeDisplayText,
        isApproved: false,
        password: registrationPasswordController.text,
        phone: registrationPhoneController.text,
        profileImage: profileImageUrl,
        shopImage: shopImageUrl,
        shopLicenseImage: licenseImageUrl,
        shopLocationLatLng: GeoPoint(
            BlocProvider.of<LocationBloc>(context).state.latLng.latitude,
            BlocProvider.of<LocationBloc>(context).state.latLng.longitude),
        shopLocationName: BlocProvider.of<LocationBloc>(context)
            .state
            .address
            .split(",")
            .first,
        shopName: registrationShopNameController.text.trim(),
        services: serviceToMapConversion(context),
        isRejected: false,
        reviewsAndRatings: {
          "review1": {"wow": 3},
          "review2": {"excellend": 5}
        }).toMap();
    try {
      await collection.add(data);
    } catch (e) {
      print("error und $e");
    }
  }
}
