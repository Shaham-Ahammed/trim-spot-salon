import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/data/repository/network_stream.dart';
import 'package:trim_spot_barber_side/utils/no_network_display_widget.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_caption.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/shop_image_display.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/appbar.dart';

import 'package:trim_spot_barber_side/widgets/shop_management_widgets/occasional_closure.dart';

import 'package:trim_spot_barber_side/widgets/shop_management_widgets/providers/providers.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/save_changes_button.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/service_error.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/services.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/headings.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/state_handler/state_handler.dart';

class ShopManagementScreen extends StatelessWidget {
  final bool fromDrawer;
  const ShopManagementScreen({super.key, this.fromDrawer = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ShapManagementProvider().getBlocProviders(),
      child: BlocListener<ShopManagementSaveButtonBloc,
          ShopManagementSaveButtonState>(
        listener: (context, state) {
          ShopManagementStateHandler.handlerState(context, state);
        },
        child: Scaffold(
          backgroundColor: blackColor,
          appBar: PreferredSize(
              preferredSize:
                  Size(double.infinity, mediaqueryHeight(0.106, context)),
              child: appBarShopManagement(fromDrawer: fromDrawer)),
          body: StreamBuilder<bool>(
              stream: checkInternetconnectivity(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(color: blackColor,);
                }

                if (!snapshot.data!) {
                  return NoNetworkDisplayWidget();
                }
                return SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            shopImageHeading(context),
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
                        NoServiceSelectedErrorDisplay(),
                        SizedBox(
                          height: mediaqueryHeight(0.02, context),
                        ),
                      
                      
                      
                        shopManagementHeadings(context, "Occasional Closures"),
                        OccasionalClosuresSelector(),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                        SaveChangesButton()
                      ],
                    ),
                  )),
                );
              }),
        ),
      ),
    );
  }
}
