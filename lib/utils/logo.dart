 import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';


class AppLogo extends StatefulWidget {
  const AppLogo({
    required this.size,
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  _AppLogoState createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300), 
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoTrim(context, widget.size),
          logoSpot(context, widget.size),
        ],
      ),
    );
  }
}

Widget logoSpot(BuildContext context, double size) {
  return myFont(
    "SPOT",
    fontFamily: bebasNeue,
    fontSize: size,
    fontWeight: FontWeight.normal,
    fontColor: cyanColor,
  );
}

Widget logoTrim(BuildContext context, double size) {
  return myFont(
    "TRIM",
    fontFamily: bebasNeue,
    fontSize: size,
    fontWeight: FontWeight.normal,
    fontColor: whiteColor,
  );
}