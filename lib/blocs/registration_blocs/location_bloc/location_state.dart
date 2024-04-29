part of 'location_bloc.dart';

@immutable
sealed class LocationState {
  final String address;
 
  final LatLng latLng;

  const LocationState({
    required this.address,
   
    required this.latLng,
  });
}

final class LocationInitial extends LocationState {
  LocationInitial({
    required String address,
  
    required LatLng latLng,
  }) : super(
            address: address,
       
            latLng: latLng);
}

final class PermissionGranted extends LocationState {
  PermissionGranted({
    required String address,

    required LatLng latLng,
  }) : super(
            address: address,
            
            latLng: latLng);
}

final class LoadingCurrentLocation extends LocationState {
  LoadingCurrentLocation({
    required String address,

    required LatLng latLng,
  }) : super(
            address: address,
           
            latLng: latLng);
}

final class FetchedCurrentLocation extends LocationState {
  final LatLng pickerLocation;
  FetchedCurrentLocation(
      {required String address,
   
      required LatLng latLng,
      required this.pickerLocation})
      : super(
            address: address,
           
            latLng: latLng);
}

final class NavigateToMap extends LocationState {
  NavigateToMap({
    required String address,

    required LatLng latLng,
  }) : super(
            address: address,
           
            latLng: latLng);
}

final class SelectedShopLocation extends LocationState {
  SelectedShopLocation({
    required String address,
   
    required LatLng latLng,
  }) : super(
            address: address,
           
            latLng: latLng);
}
