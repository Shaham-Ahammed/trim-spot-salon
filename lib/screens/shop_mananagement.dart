import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/loading_indicator.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
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
        BlocProvider<ShopManagementSaveButtonBloc>(
            create: (context) => ShopManagementSaveButtonBloc()),
        BlocProvider<OccasionalClosureBloc>(
            create: (context) => OccasionalClosureBloc()),
      ],
      child: BlocListener<ShopManagementSaveButtonBloc,
          ShopManagementSaveButtonState>(
        listener: (context, state) {
          if (state is ShopMangaementLoadingIndicator) {
            loadingIndicator(context);
          }
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
                  shopManagementHeadings(context, "Services"),
                  ServicesMenu(),
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
