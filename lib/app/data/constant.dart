import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
const Color kRichBlack = Color(0xFF000814);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kBlue = Color.fromRGBO(52, 152, 219, 1);
const Color kGreen = Color.fromRGBO(46, 204, 113, 0.88);
const Color kMidGreen = Color.fromRGBO(63, 187, 166, 1);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kGrey = Color(0xFF303030);
const Color kRed = Color(0xFFff0000);
const LinearGradient gradientPrimary = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    kBlue,
    kGreen,
  ],
);

// text style
final TextStyle kHeading5 =
    GoogleFonts.coda(fontSize: 23, fontWeight: FontWeight.w400, color: kBlue);
final TextStyle kHeading6 = GoogleFonts.coda(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: kBlue);
final TextStyle kSubtitle = GoogleFonts.coda(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: kBlue);
final TextStyle kBodyText = GoogleFonts.coda(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: kBlue);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kBlue,
  primaryContainer: kBlue,
  secondary: kBlue,
  secondaryContainer: kBlue,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: kRichBlack,
  onBackground: Colors.white,
  onError: Colors.red,
  brightness: Brightness.light,
);
