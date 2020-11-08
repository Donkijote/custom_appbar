import 'package:flutter/material.dart';

const appColor = Color(colorPrimary);

const backgroundColor = Color(0xFFF3F5F6);

const blackColor = Color(0xFF263238);

const colorPrimary = 0xFFD90429;
const colorSecondary = 0xFFEF233C;

const linkColor = Color(0xFF1891CE);
const secondaryColor = Color(colorSecondary);
const whiteColor = Color(0xFFFFFFFF);
MaterialColor primarySwatch = MaterialColor(
  colorPrimary,
  <int, Color>{
    50: appColor.withOpacity(.1),
    100: appColor.withOpacity(.2),
    200: appColor.withOpacity(.3),
    300: appColor.withOpacity(.4),
    400: appColor.withOpacity(.5),
    500: appColor.withOpacity(.6),
    600: appColor.withOpacity(.7),
    700: appColor.withOpacity(.8),
    800: appColor.withOpacity(.9),
    900: appColor.withOpacity(1),
  },
);

class MenuItem {
  final String title;
  final IconData icon;
  final double x;
  MenuItem({this.title, this.icon, this.x});
}
