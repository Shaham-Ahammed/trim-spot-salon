import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bookings.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/completed_bookings_container.dart';

class CompletedBookingsScreen extends StatelessWidget {
  const CompletedBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.03, context)),
        child: ListView.builder(
          itemCount: bookingCompletedDetails.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: mediaqueryHeight(0.025, context)),
              child: completedBookingsDetailsContainer(context, index),
            );
          },
        ),
      )),
    );
  }
}
