import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';

import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/service_rate.dart';
import 'package:trim_spot_barber_side/widgets/signup_widgets/service_time.dart';

Column registerServicesShopManagement(
    BuildContext context, String service, bool state, String serviceName,
    {required final TextEditingController serviceTimeController,
    required final TextEditingController serviceRateController}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            width: mediaqueryWidth(0.3, context),
            child: myFont(service,
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.0214, context),
                fontWeight: FontWeight.w600,
                fontColor: greyColor),
          ),
          Transform.scale(
            scale: 1,
            child: Checkbox(
              activeColor: Colors.blueGrey.shade500,
              checkColor: whiteColor,
              value: state,
              onChanged: (value) {
                context.read<ShopManagementServiceBloc>().add(
                    ServiceSwitchPressed(
                        service: serviceName,
                        ratecontroller: serviceRateController,
                        timeController: serviceTimeController));
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          SizedBox(
            width: mediaqueryWidth(0.01, context),
          ),
          ServiceTimeTextFormField(
            enabled: state,
            timeController: serviceTimeController,
          ),
          SizedBox(
            width: mediaqueryWidth(0.02, context),
          ),
          ServiceRateTextFormField(
            enabled: state,
            rateController: serviceRateController,
          )
        ],
      ),
      SizedBox(
        height: mediaqueryHeight(0.011, context),
      ),
    ],
  );
}
