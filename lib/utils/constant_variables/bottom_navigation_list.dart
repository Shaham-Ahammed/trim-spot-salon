  import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:trim_spot_barber_side/screens/bookings.dart';
import 'package:trim_spot_barber_side/screens/home.dart';
import 'package:trim_spot_barber_side/screens/profile.dart';
import 'package:trim_spot_barber_side/screens/shop_mananagement.dart';

List<Widget> tabs = [
      HomeScreen(),
      BookingsScreen(),
      ShopManagementScreen(),
      ProfileScreen()
    ];

List<GButton>gButtons= [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.calendar_month_sharp,
            text: 'Bookings',
          ),
          GButton(
            icon: Icons.storefront,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          )
        ];