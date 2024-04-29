import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc()
      : super(LocationInitial(
          address: "",
          latLng: LatLng(0, 0),
        )) {
    on<LocationPickerPressed>(_locationPickerPressed);
    on<TappedOnLocation>(_tappedOnLocation);
    on<PickedShopPosition>(_pickedShopLocation);
  }
  _locationPickerPressed(
      LocationPickerPressed event, Emitter<LocationState> emit) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final checkPermission = await Permission.location.request();
    if (checkPermission.isGranted) {
      emit(NavigateToMap(address: (state.address), latLng: state.latLng));
      emit(
          LoadingCurrentLocation(address: state.address, latLng: state.latLng));

      loc.Location location = loc.Location();
      try {
        final current = await location.getLocation();

        emit(FetchedCurrentLocation(
            address: state.address,
            latLng: state.latLng,
            pickerLocation: LatLng(current.latitude!, current.longitude!)));
      } catch (e) {}
    }
  }

  _tappedOnLocation(TappedOnLocation event, Emitter<LocationState> emit) {
    emit(FetchedCurrentLocation(
        address: state.address,
        pickerLocation:
            LatLng(event.newPosition.latitude, event.newPosition.longitude),
        latLng: state.latLng));
  }

  _pickedShopLocation(
      PickedShopPosition event, Emitter<LocationState> emit) async {
    try {
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
              event.position.latitude, event.position.longitude);

      geocoding.Placemark place = placemarks.first;
      String addressPosition =
          "${place.locality}, ${place.administrativeArea}, ${place.country}";
      print(addressPosition);
      double lat = event.position.latitude;
      double lng = event.position.longitude;
      emit(LocationInitial(address: addressPosition, latLng: LatLng(lat, lng)));
    } catch (e) {
      print("Error fetching placemarks: $e");
    }
  }
}
