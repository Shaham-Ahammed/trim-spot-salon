import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/screens/bookings.dart';
import 'package:trim_spot_barber_side/screens/customer_support.dart';
import 'package:trim_spot_barber_side/screens/privacy_policy.dart';
import 'package:trim_spot_barber_side/screens/profile.dart';
import 'package:trim_spot_barber_side/screens/reviews_and_ratings.dart';
import 'package:trim_spot_barber_side/screens/shop_mananagement.dart';
import 'package:trim_spot_barber_side/screens/terms_and_conditions.dart';
import 'package:trim_spot_barber_side/utils/homepage/drawer/listtile_widget.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/logout_confirmation_home.dart';
import 'package:trim_spot_barber_side/widgets/drawer_home/rating_alert.dart';

Expanded listviewDrawerHome(BuildContext context) {
  return Expanded(
    child: ListView(
      children: [
        drawerListTiles(context, iconSize: mediaqueryHeight(0.03, context),
            function: () {
          Navigator.pop(context);
          return null;
        }, icon: Icons.home_outlined, title: "Home"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: BookingsScreen(
            fromDrawer: true,
          )));
          return null;
        }, icon: Icons.calendar_today_outlined, title: "Bookings"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: ShopManagementScreen(
            fromDrawer: true,
          )));
          return null;
        }, icon: Icons.store_mall_directory_outlined, title: "Shop Management"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: ProfileScreen(
            fromDawer: true,
          )));
          return null;
        }, icon: Icons.person_3_outlined, title: "Profile"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: ReviewsAndRatingsScreen()));
          return null;
        }, icon: Icons.reviews_outlined, title: "Reviews & Ratings"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: CustomerSupport()));
          return null;
        }, icon: Icons.headset_mic_outlined, title: "Customer Support"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context).push(
              FadeTransitionPageRoute(child: const TermsAndConditionsScreen()));
          return null;
        }, icon: Icons.list_alt_outlined, title: "Terms & Conditions"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context).push(
              FadeTransitionPageRoute(child: const PrivacyPolicyScreen()));
          return null;
        }, icon: Icons.privacy_tip_outlined, title: "Privacy Policy"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          ratingAlert(context);
          return null;
        },
            color: Colors.yellow.shade600,
            icon: Icons.star_rate_rounded,
            title: "Rate Us"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          logoutConfirmationHome(context);
          return null;
        }, icon: Icons.logout_outlined, title: "Logout"),
      ],
    ),
  );
}
