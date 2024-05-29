import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';


class ProofsHeading extends StatelessWidget {
  const ProofsHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: myFont("Proofs",
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.023, context),
          fontWeight: FontWeight.w600,
          fontColor: greyColor2),
    );
  }
}

class ShopImageHeading extends StatelessWidget {
  const ShopImageHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: myFont("Shop Image",
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.023, context),
          fontWeight: FontWeight.w600,
          fontColor: greyColor2),
    );
  }
}

class WorkingHoursHeading extends StatelessWidget {
  const WorkingHoursHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const RegisterHeadings(
      heading: "Working Hours",
    );
  }
}

class ServiceHeading extends StatelessWidget {
  const ServiceHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const RegisterHeadings(
      heading: "Services",
    );
  }
}




class RegisterHeadings extends StatelessWidget {
  final String heading;
  const RegisterHeadings({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: myFont(heading,
          fontFamily: balooChettan,
          fontSize:mediaqueryHeight(0.023, context),
          fontWeight: FontWeight.w600,
          fontColor: greyColor2),
    );
  }
}

