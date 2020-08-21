import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningflutterexamples/general/app_colors.dart';

final appTheme = ThemeData(
  primarySwatch: AppColors.primarySwatch,
  accentColor: AppColors.accentColor,
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: GoogleFonts.indieFlower(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        fontSize: 20.0,
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primarySwatch,
  ),
);
