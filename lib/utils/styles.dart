import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Colors
const Map<int, Color> color = {
  50: Color.fromRGBO(254, 117, 0, .1),
  100: Color.fromRGBO(254, 117, 0, .2),
  200: Color.fromRGBO(254, 117, 0, .3),
  300: Color.fromRGBO(254, 117, 0, .4),
  400: Color.fromRGBO(254, 117, 0, .5),
  500: Color.fromRGBO(254, 117, 0, .6),
  600: Color.fromRGBO(254, 117, 0, .7),
  700: Color.fromRGBO(254, 117, 0, .8),
  800: Color.fromRGBO(254, 117, 0, .9),
  900: Color.fromRGBO(254, 117, 0, 1),
};

const MaterialColor appCustomColor = MaterialColor(0XFFFF7500, color);

const appPrimaryColor = const Color(0XFFFF7500);
const appAccentColor = const Color(0XFF282C3A);
const textPrimaryColor = Colors.white;
const textSecondaryColorOne = const Color(0XFFD0DBE6);
const textSecondaryColorTwo = const Color(0XFF767C91);
const buttonSecondaryColor = const Color(0XFF3C435D);
const backgroundGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0, 0.4, 1],
  colors: [
    Color(0XFF3D4151),
    Color(0XFF1C202C),
    Color(0XFF141824),
  ],
);

// Fonts
const String helveticaNeue = "Helvetica_Neue";
const String roboto = "Roboto";
const String sfPro = "SfPro";

// Text Styles
const TextStyle largeTextOneTextPrimaryColorReg =
    TextStyle(fontSize: 80, color: textPrimaryColor);
const TextStyle largeTextOneTextPrimaryColorBold = TextStyle(
    fontSize: 80, color: textPrimaryColor, fontWeight: FontWeight.bold);

const TextStyle largeTextTwoTextPrimaryColorReg =
    TextStyle(fontSize: 42, color: textPrimaryColor);
const TextStyle largeTextTwoTextPrimaryColorBold = TextStyle(
    fontSize: 42, color: textPrimaryColor, fontWeight: FontWeight.bold);

const TextStyle mediumTextOneTextPrimaryColorReg =
    TextStyle(fontSize: 28, color: textPrimaryColor);
const TextStyle mediumTextOneTextPrimaryColorBold = TextStyle(
    fontSize: 28, color: textPrimaryColor, fontWeight: FontWeight.bold);
const TextStyle mediumTextOneAppPrimaryColorReg =
    TextStyle(fontSize: 28, color: appPrimaryColor);
const TextStyle mediumTextOneAppPrimaryColorBold = TextStyle(
    fontSize: 28, color: appPrimaryColor, fontWeight: FontWeight.bold);
const TextStyle mediumTextOneTextSecondaryColorOneReg =
    TextStyle(fontSize: 28, color: textSecondaryColorOne);
const TextStyle mediumTextOneTextSecondaryColorOneBold = TextStyle(
    fontSize: 28, color: textSecondaryColorOne, fontWeight: FontWeight.bold);

const TextStyle smallTextOneTextPrimaryColorReg =
    TextStyle(fontSize: 20, color: textPrimaryColor);
const TextStyle smallTextOneTextPrimaryColorBold = TextStyle(
    fontSize: 20, color: textPrimaryColor, fontWeight: FontWeight.bold);
const TextStyle smallTextOneAppPrimaryColorReg =
    TextStyle(fontSize: 20, color: appPrimaryColor);
const TextStyle smallTextOneAppPrimaryColorBold = TextStyle(
    fontSize: 20, color: appPrimaryColor, fontWeight: FontWeight.bold);
const TextStyle smallTextOneTextSecondaryColorOneReg =
    TextStyle(fontSize: 20, color: textSecondaryColorOne);
const TextStyle smallTextOneTextSecondaryColorOneBold = TextStyle(
    fontSize: 20, color: textSecondaryColorOne, fontWeight: FontWeight.bold);

const TextStyle tinyTextOneAppPrimaryColorReg =
    TextStyle(fontSize: 16, color: appPrimaryColor);
const TextStyle tinyTextOneAppPrimaryColorBold = TextStyle(
    fontSize: 16, color: appPrimaryColor, fontWeight: FontWeight.bold);
const TextStyle tinyTextOneTextSecondaryColorTwoReg =
    TextStyle(fontSize: 16, color: textSecondaryColorTwo);
const TextStyle tinyTextOneTextSecondaryColorTwoBold = TextStyle(
    fontSize: 16, color: textSecondaryColorTwo, fontWeight: FontWeight.bold);

// Spaces
const SizedBox vSpace5 = SizedBox(height: 5);
const SizedBox vSpace10 = SizedBox(height: 10);
const SizedBox vSpace15 = SizedBox(height: 15);
const SizedBox vSpace20 = SizedBox(height: 20);
const SizedBox vSpace30 = SizedBox(height: 30);
const SizedBox vSpace40 = SizedBox(height: 40);
const SizedBox vSpace50 = SizedBox(height: 50);
const SizedBox vSpace60 = SizedBox(height: 60);
const SizedBox vSpace70 = SizedBox(height: 70);

const SizedBox hSpace5 = SizedBox(width: 5);
const SizedBox hSpace10 = SizedBox(width: 10);
const SizedBox hSpace15 = SizedBox(width: 15);
const SizedBox hSpace20 = SizedBox(width: 20);
const SizedBox hSpace30 = SizedBox(width: 30);
const SizedBox hSpace40 = SizedBox(width: 40);
const SizedBox hSpace50 = SizedBox(width: 50);
const SizedBox hSpace60 = SizedBox(width: 60);
const SizedBox hSpace70 = SizedBox(width: 70);
