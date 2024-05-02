import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';

import 'package:trim_spot_barber_side/widgets/map_widgets/loading_screen.dart';
import 'package:trim_spot_barber_side/widgets/map_widgets/map_screen.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LoadingCurrentLocation) {
            return FetchingLocationScreenMap();
          }
          if (state is FetchedCurrentLocation) {
            return DisplayMap(state);
          }
          return Container();
        },
      ),
    );
  }
}



