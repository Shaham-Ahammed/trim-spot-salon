import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';



class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({
    super.key,
  });

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LoadingCurrentLocation) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCube(
                  color: cyanColor,
                  size: mediaqueryWidth(0.2, context),
                ),
                SizedBox(
                  height: mediaqueryHeight(0.07, context),
                ),
                myFont("fetching your location",
                    fontFamily: b612,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontColor: whiteColor)
              ],
            );
          }
          if (state is FetchedCurrentLocation) {
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
                Positioned(
                    bottom: mediaqueryHeight(0.07, context),
                    left: mediaqueryWidth(0.28, context),
                    child: Material(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(90),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(90),
                        onTap: () {
                          context.read<LocationBloc>().add(PickedShopPosition(
                              position: state.pickerLocation));
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: cyanColor, width: 4),
                            borderRadius: BorderRadius.circular(90),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaqueryWidth(0.1, context),
                                vertical: mediaqueryHeight(0.006, context)),
                            child: myFont("Drop Here 📍",
                                fontFamily: belleza,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontColor: Colors.white),
                          ),
                        ),
                      ),
                    ))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
