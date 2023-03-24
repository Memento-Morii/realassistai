import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

class ThemeText {
  static TextStyle headlineOne = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    // color: Colors.black,
  );
  static TextStyle headlineTwo = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle headlineThree = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle headlineWhiteThree = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle headlineFour = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle headlinePrimaryOne = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: CustomColors.primaryColor,
  );

  static TextStyle bodyBoldOne = GoogleFonts.manrope(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle bodyBoldTwo = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle bodyBoldWhiteTwo = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle bodyOne = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle bodyTwo = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle bodyThreeItalic = GoogleFonts.manrope(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: Colors.black.withOpacity(.5),
  );
  static TextStyle bodyThree = GoogleFonts.manrope(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(.5),
  );
  static TextStyle bodyWhiteOne = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static TextStyle bodyGreyLineThrough = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle bodyPrimaryColorLineThrough = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle bodyOne_50 = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(.5),
  );
  static TextStyle bodyPrimaryOne = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor,
  );
  static TextStyle bodyPrimaryAccentOne = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor.withOpacity(.5),
  );
  static TextStyle bodyPrimaryTwo = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor,
  );

  static TextStyle errorWhiteText = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: GoogleFonts.manrope(
      fontWeight: FontWeight.normal,
    ).fontFamily,
  );

  static TextStyle warningTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: GoogleFonts.manrope(
      fontWeight: FontWeight.normal,
    ).fontFamily,
  );

  static TextStyle successTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: GoogleFonts.manrope(
      fontWeight: FontWeight.normal,
    ).fontFamily,
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: CustomColors.primaryColor,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: CustomColors.primaryColor,
    colorScheme: const ColorScheme.light(),
  );
}
