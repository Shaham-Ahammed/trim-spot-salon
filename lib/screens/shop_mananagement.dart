import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/shop_management/appbar.dart';
import 'package:trim_spot_barber_side/utils/shop_management/closing_time.dart';
import 'package:trim_spot_barber_side/utils/shop_management/holiday_selector.dart';
import 'package:trim_spot_barber_side/utils/shop_management/occasional_closure.dart';
import 'package:trim_spot_barber_side/utils/shop_management/one_week.dart';
import 'package:trim_spot_barber_side/utils/shop_management/opening_time.dart';
import 'package:trim_spot_barber_side/utils/shop_management/services.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/headings.dart';

class ShopManagementScreen extends StatefulWidget {
  const ShopManagementScreen({super.key});

  @override
  State<ShopManagementScreen> createState() => _ShopManagementScreenState();
}

class _ShopManagementScreenState extends State<ShopManagementScreen> {
  @override
  Widget build(BuildContext context) {
    getOneWeekFromToday();
    return MultiBlocProvider(
      providers: [
        BlocProvider<OccasionalClosureBloc>(
          create: (context) => OccasionalClosureBloc()),
       BlocProvider(create: (context) => HolidayBloc()),
        BlocProvider<ServiceBloc>(create: (context) => ServiceBloc()),
        BlocProvider<WorkingHoursBloc>(create: (context) => WorkingHoursBloc()),
      ],
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, mediaqueryHeight(0.106, context)),
            child: appBarShopManagement()),
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
                Center(
                    child: submitButtonCyan(context, text: "save changes",
                        function: () {
                  return null;
                },
                        heigh: mediaqueryHeight(0.05, context),
                        width: mediaqueryWidth(0.5, context),
                        fontSize: mediaqueryHeight(0.024, context)))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
