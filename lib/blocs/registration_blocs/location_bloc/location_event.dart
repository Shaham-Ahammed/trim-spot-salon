part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

class LocationPickerPressed extends LocationEvent {}

final class TappedOnLocation extends LocationEvent {
  final LatLng newPosition;
  TappedOnLocation({required this.newPosition});
}

final class PickedShopPosition extends LocationEvent {
 final LatLng position;

  PickedShopPosition({required this.position});
  
}

