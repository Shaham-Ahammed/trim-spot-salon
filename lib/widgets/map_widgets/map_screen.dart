import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';

import 'package:trim_spot_barber_side/widgets/map_widgets/drop_here_button.dart';

class DisplayMap extends StatelessWidget {
  final FetchedCurrentLocation state;
  const DisplayMap(
    this.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            initialCameraPosition: CameraPosition(
              target: state.pickerLocation,
              zoom: 15,
            ),
            onTap: (position) {
              context
                  .read<LocationBloc>()
                  .add(TappedOnLocation(newPosition: position));
            },
            markers: {
              Marker(
                  position: state.pickerLocation,
                  markerId: const MarkerId("location picker"),
                  icon: BitmapDescriptor.defaultMarker)
            }),
        DropHereButton(state: state)
      ],
    );
  }
}