import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/completed_bookings.dart';
import 'package:trim_spot_barber_side/screens/pending_bookings.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bookings.dart';
import 'package:trim_spot_barber_side/widgets/bookings_widgets/appbar.dart';

class BookingsScreen extends StatefulWidget {
  final bool fromDrawer;
  const BookingsScreen({super.key,this.fromDrawer=false});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: appBar(context,widget.fromDrawer),
      body: TabBarView(
        controller: tabController,
        children: [PendingBookingsScreen(), CompletedBookingsScreen()],
      ),
    );
  }
}
