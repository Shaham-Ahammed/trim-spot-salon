import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/models/bookings_modal.dart';

const List<Tab> myTabs = <Tab>[
    Tab(text: "PENDINGS"),
    Tab(
      text: "COMPLETED",
    ),
  ];
 late TabController tabController;

const List<String> datas = ["Name", "Time", "Services"];

List<BookingDetails> bookingCompletedDetails = [
  BookingDetails(
      name: "Shadin", time: "14:00 - 15:00 ", services: "Shave, Trim"),
BookingDetails(name: "Adnan", time:  "16:00 - 17:00", services: "Facial"),
];
