import 'package:flutter/material.dart';

const accentColor = const Color(0XFF00B27A); //##00B27A
const textColor = const Color(0XFF64697C); //#64697C
const lightGrey = const Color(0xFFD6D6D6); //#D6D6D6
const darkGrey = const Color(0xFF707070); //##707070

const String helveticaNeue = "Helvetica_Neue";
const String roboto = "Roboto";
const String sfPro = "SfPro";

MaterialColor myColor = MaterialColor(0XFF81FFAD, color);

Map<int, Color> color = {
  50: Color.fromRGBO(0, 178, 122, .1),
  100: Color.fromRGBO(0, 178, 122, .2),
  200: Color.fromRGBO(0, 178, 122, .3),
  300: Color.fromRGBO(0, 178, 122, .4),
  400: Color.fromRGBO(0, 178, 122, .5),
  500: Color.fromRGBO(0, 178, 122, .6),
  600: Color.fromRGBO(0, 178, 122, .7),
  700: Color.fromRGBO(0, 178, 122, .8),
  800: Color.fromRGBO(0, 178, 122, .9),
  900: Color.fromRGBO(0, 178, 122, 1),
};

//add your styles here
const TextStyle medium20sp = TextStyle(fontSize: 20);
const TextStyle buttonStyle =
    TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w200);
const TextStyle buttonTextStyle =
    TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.w200);
const TextStyle buttonSubTextStyle =
    TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w200);
const TextStyle appBarStyle =
    TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300);
const TextStyle medium20spRed = TextStyle(fontSize: 20, color: accentColor);
const TextStyle medium18sp = TextStyle(fontSize: 18, color: Colors.grey);
const TextStyle largeTextWhiteBold =
    TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold);
const TextStyle infoTextStyleLightGrey =
    TextStyle(fontSize: 14, color: lightGrey);
const TextStyle infoTextStyleBold =
    TextStyle(fontSize: 18, color: darkGrey, fontWeight: FontWeight.bold);
const TextStyle infoTextStyleBoldAccent =
    TextStyle(fontSize: 18, color: accentColor, fontWeight: FontWeight.bold);
const TextStyle detailSmallTextStyleLightGrey = TextStyle(
    fontSize: 12,
    color: darkGrey,
    fontWeight: FontWeight.w100,
    fontFamily: helveticaNeue);
const TextStyle detailMediumTextStyleGrey = TextStyle(
    fontSize: 16,
    color: darkGrey,
    fontWeight: FontWeight.w400,
    fontFamily: helveticaNeue);

const SizedBox tinySpace = SizedBox(height: 5);
const SizedBox smallSpace = SizedBox(height: 12, width: 12);
const SizedBox mediumSpace = SizedBox(height: 20, width: 20);
const SizedBox bigSpace = SizedBox(height: 40);
