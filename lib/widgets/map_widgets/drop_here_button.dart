import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class DropHereButton extends StatelessWidget {
  final FetchedCurrentLocation state;
  const DropHereButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: mediaqueryHeight(0.07, context),
        left: mediaqueryWidth(0.28, context),
        child: Material(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(90),
          child: InkWell(
            borderRadius: BorderRadius.circular(90),
            onTap: () {
              context
                  .read<LocationBloc>()
                  .add(PickedShopPosition(position: state.pickerLocation));
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
        ));
  }
}