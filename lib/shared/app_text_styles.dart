import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_demo/shared/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle normalRegular12 = GoogleFonts.lato(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textDefaultColor,
  );

  static TextStyle italicRegular12 = GoogleFonts.lato(
    fontStyle: FontStyle.italic,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textDefaultColor,
  );

  static TextStyle normalRegular16 = GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textDefaultColor,
  );

  static TextStyle italicRegular16 = GoogleFonts.lato(
    fontStyle: FontStyle.italic,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textDefaultColor,
  );

  static TextStyle normalMedium16 = GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textDefaultColor,
  );

  static TextStyle normalBold16 = GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDefaultColor,
  );

  static TextStyle normalBold20 = GoogleFonts.lato(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDefaultColor,
  );

  static TextStyle normalBold24 = GoogleFonts.lato(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDefaultColor,
  );

  static TextStyle normalBold40 = GoogleFonts.lato(
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDefaultColor,
  );
}
