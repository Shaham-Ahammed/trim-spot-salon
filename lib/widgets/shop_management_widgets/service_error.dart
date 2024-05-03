import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class NoServiceSelectedErrorDisplay extends StatelessWidget {
  const NoServiceSelectedErrorDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopManagementServiceBloc,
        ShopManagementServiceBlocState>(
      builder: (context, state) {
        final map = state.switches;
        bool anySelected = false;
        for (var selected in map.values) {
          if (selected == true) {
            anySelected = true;
          }
        }
        if (!anySelected) {
          return Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: mediaqueryHeight(0.02, context),
                  top: mediaqueryHeight(0.007, context)),
              child: Text(
                "pick select atleast one service",
                style: TextStyle(
                  color: Colors.red.shade800,
                  fontSize: 13.0,
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
