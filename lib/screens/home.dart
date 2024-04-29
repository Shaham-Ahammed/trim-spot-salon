import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';
import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/homepage/animation_control.dart';
import 'package:trim_spot_barber_side/utils/homepage/page_transition_home.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/app_bar.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/bookings_container.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/earnings_container.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/lock_slots_button.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/smooth_page_indicator.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/todays_booking_heading.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    pageViewAutomaticTransition(context);
    super.initState();
  }

  @override
  void dispose() {
    pageViewAutomaticTransition(context).cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SlotSelectionBloc>(
            create: (context) => SlotSelectionBloc()),
      ],
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, mediaqueryHeight(0.106, context)),
            child: AppBarHomeScreen()),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(mediaqueryWidth(0.04, context)),
            child: Column(
              children: [
                Container(
                  height: mediaqueryHeight(0.2, context),
                  child: PageView(
                    controller: homePageController,
                    onPageChanged: (int page) {
                      context
                          .read<HomeScreenPageControllerBloc>()
                          .add(PageChanged(newPage: page));
                    },
                    children: [
                      EarningsPageView(),
                      BookingsPageView(),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryHeight(0.01, context),
                ),
                SmoothPageIndicatorHomeScreen(),
                SizedBox(
                  height: mediaqueryHeight(0.01, context),
                ),
                TodaysBookingsHeading(),
                SlotTiles(),
                SizedBox(
                  height: mediaqueryHeight(0.023, context),
                ),
                LockSlotsButton()
              ],
            ),
          )),
        ),
      ),
    );
  }
}


