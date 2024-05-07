import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/homepage/animation_control.dart';
import 'package:trim_spot_barber_side/utils/homepage/page_transition_home.dart';
import 'package:trim_spot_barber_side/utils/network_stream/network_stream.dart';
import 'package:trim_spot_barber_side/utils/no_network_display_widget.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/functions/total_earnings_fetching.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/shimmer_containers.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/app_bar.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/bookings_container.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/earnings_container.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/lock_slots_button.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots_shimmer_effect.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/smooth_page_indicator.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/todays_booking_heading.dart';
import 'package:lottie/lottie.dart';

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
    return Scaffold(
      backgroundColor: blackColor,
      appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, mediaqueryHeight(0.106, context)),
          child: AppBarHomeScreen()),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(mediaqueryWidth(0.04, context)),
        child: StreamBuilder<bool>(
            stream: checkInternetconnectivity(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  color: blackColor,
                );
              }

              if (!snapshot.data!) {
                return NoNetworkDisplayWidget();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: mediaqueryHeight(0.2, context),
                      child: FutureBuilder(
                        future: futureFucntion(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ShimmerEffectPageViewContainersInHome();
                          }
                          return PageView(
                            controller: homePageController,
                            onPageChanged: (int page) {
                              context
                                  .read<HomeScreenPageControllerBloc>()
                                  .add(PageChanged(newPage: page));
                            },
                            children: [
                              EarningsPageView(snapshot.data.toString()),
                              BookingsPageView(),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.01, context),
                    ),
                    SmoothPageIndicatorHomeScreen(),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                  TodaysBookingsHeading(),
                        FutureBuilder<bool>(
                      future: holidaychecking(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SlotsInShimmerEffect();
                        }
                        if (snapshot.data!) {
                          return Center(
                              child: LottieBuilder.asset(
                                
                                  "assets/animations/shop_closed 1.json",
                                  
                                  height: mediaqueryHeight(0.4, context),));
                        }
                        return Column(
                          children: [
                            SlotTiles(),
                            SizedBox(
                              height: mediaqueryHeight(0.023, context),
                            ),
                            LockSlotsButton()
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      )),
    );
  }
}

Future<bool> holidaychecking() async {
  final today = DateFormat('E').format(DateTime.now());
  final data = await UserDataDocumentFromFirebase().userDocument();
  List<String> holidays =
      (data[SalonDocumentModel.holidays] as List<dynamic>).cast<String>();
  if (holidays.contains(today)) {
    return true;
  }
  return false;
}
