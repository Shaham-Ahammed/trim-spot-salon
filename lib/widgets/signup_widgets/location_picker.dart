import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/screens/map.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    super.key,
  });

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is NavigateToMap) {
          Navigator.of(context)
              .push(NoTransitionPageRoute(child: GoogleMapScreen( )));
        }
      },
      builder: (context, state) {
        return Material(
          borderRadius: BorderRadius.circular(8),
          color: greyColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              context.read<LocationBloc>().add(LocationPickerPressed());
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              height: mediaqueryHeight(0.06, context),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaqueryWidth(0.045, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state.address.isEmpty)
                      myFont("Shop Location",
                          fontFamily: balooChettan,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontColor: Colors.black54),
                    if (state.address.isNotEmpty)
                      Expanded(
                          child: Container(
                        child: myFont(state.address,
                            fontFamily: balooChettan,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontColor: Colors.black54),
                      )),
                    Icon(
                      Icons.location_pin,
                      color: Colors.red.shade800,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
