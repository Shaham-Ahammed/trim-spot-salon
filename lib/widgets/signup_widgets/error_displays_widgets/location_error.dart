import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/registration_page/container_validations.dart';

class LocationValidationErrorMessage extends StatelessWidget {
  const LocationValidationErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
     builder: (context, state) {
       if (state.address.isEmpty && registerbuttonPressed(context)) {
         return Align(
           alignment: Alignment.topLeft,
           child: Padding(
             padding: EdgeInsets.only(
                 left: mediaqueryHeight(0.02, context),
                 top: mediaqueryHeight(0.007, context)),
             child: Text(
               "select location",
               style: TextStyle(
                 color: Colors.red.shade800,
                 fontSize: 13.0,
               ),
             ),
           ),
         );
       }
       return Container();
     },
          );
  }
}
