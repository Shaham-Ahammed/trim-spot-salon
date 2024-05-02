import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/service_helper.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/service.dart';

class ServicesMenu extends StatefulWidget {
  const ServicesMenu({
    super.key,
  });

  @override
  State<ServicesMenu> createState() => _ServicesMenuState();
}

class _ServicesMenuState extends State<ServicesMenu> {
  @override
  void initState() {
    context.read<ShopManagementServiceBloc>().add(FetchingOriginalServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cyanColor, width: 2)),
      child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.017, context)),
        child: BlocBuilder<ShopManagementServiceBloc,
            ShopManagementServiceBlocState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                registerServicesShopManagement(
                    context, "HAIRCUT", state.switches["haircut"]!, "haircut",
                    serviceRateController: haircutRateController,
                    serviceTimeController: haircutTimeController),
                registerServicesShopManagement(
                    context, "FACIAL", state.switches["facial"]!, "facial",
                    serviceRateController: facialRateController,
                    serviceTimeController: facialTimeController),
                registerServicesShopManagement(context, "STRAIGHTEN",
                    state.switches["straighten"]!, "straighten",
                    serviceRateController: straightenRateController,
                    serviceTimeController: straightenTimeController),
                registerServicesShopManagement(
                    context, "MASSAGE", state.switches["massage"]!, "massage",
                    serviceRateController: massageRateController,
                    serviceTimeController: massageTimeController),
                registerServicesShopManagement(context, "BEARD TRIM",
                    state.switches["beard trim"]!, "beard trim",
                    serviceRateController: beardTrimRateController,
                    serviceTimeController: beardTrimTimeController),
                registerServicesShopManagement(
                    context, "SHAVE", state.switches["shave"]!, "shave",
                    serviceRateController: shaveRateController,
                    serviceTimeController: shaveTimeController)
              ],
            );
          },
        ),
      ),
    );
  }
}
