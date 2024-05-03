import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/error_snackbars.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/network_error_snackbar.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_caption.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_display.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/appbar.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/closing_time.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/holiday_selector.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/occasional_closure.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/opening_time.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/save_changes_button.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/services.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/headings.dart';

class ShopManagementScreen extends StatelessWidget {
  final bool fromDrawer;
  const ShopManagementScreen({super.key, this.fromDrawer = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopManagementServiceBloc>(
            create: (context) => ShopManagementServiceBloc()),
        BlocProvider<ShopManagementSaveButtonBloc>(
            create: (context) => ShopManagementSaveButtonBloc()),
        BlocProvider<OccasionalClosureBloc>(
            create: (context) => OccasionalClosureBloc()),
        BlocProvider<ProfileShopImageBloc>(
            create: (context) => ProfileShopImageBloc()),
      ],
      child: BlocListener<ShopManagementSaveButtonBloc,
          ShopManagementSaveButtonState>(
        listener: (context, state) {
       
        },
        child: Scaffold(
          backgroundColor: blackColor,
          appBar: PreferredSize(
              preferredSize:
                  Size(double.infinity, mediaqueryHeight(0.106, context)),
              child: appBarShopManagement(fromDrawer: fromDrawer)),
          body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      myFont("Shop Image",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.023, context),
                          fontWeight: FontWeight.w700,
                          fontColor: greyColor2),
                      SizedBox(
                        height: mediaqueryHeight(0.002, context),
                      )
                    ],
                  ),
                  shopImageCaption(context),
                  SizedBox(
                    height: mediaqueryHeight(0.012, context),
                  ),
                  ShopImageDisplay(),
                  SizedBox(
                    height: mediaqueryHeight(0.015, context),
                  ),
                  shopManagementHeadings(context, "Services"),
                  ServicesMenu(),
                  BlocBuilder<ShopManagementServiceBloc,
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
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  shopManagementHeadings(context, "Opening Time"),
                  OpeningTimeSelector(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  shopManagementHeadings(context, "Closing Time"),
                  ClosingTimeSelector(),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  shopManagementHeadings(context, "Holidays"),
                  HolidaySelector(),
                  shopManagementHeadings(context, "Occasional Closures"),
                  OccasionalClosuresSelector(),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  SaveChangesButton()
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
