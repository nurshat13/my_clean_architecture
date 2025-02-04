// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_clean_architecture/core/constants/app_colors.dart';

ThemeData APP_THEME(BuildContext context) => ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary(context),
      primaryColorLight: Color(0xFFE7EBFF),
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: GoogleFonts.latoTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: Color(0xFFE0E2D8)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: Color(0xFF878882)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: AppColors.primary(context), width: 2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: AppColors.error, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: AppColors.error, width: 2.w),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        helperStyle: GoogleFonts.lato(
          color: Color(0xFF1B1B1B),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1.25,
          letterSpacing: 0.24,
        ),
        errorStyle: GoogleFonts.lato(
          color: AppColors.error,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          height: 1.25,
          letterSpacing: 0.24,
        ),
        floatingLabelStyle: GoogleFonts.lato(
          color: Color(0xFF1B1B1B),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.24,
        ),
        labelStyle: GoogleFonts.lato(
          color: Color(0xFF1B1B1B),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.24,
        ),
        hintStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          color: AppColors.gray,
          letterSpacing: 0.24,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary(context),
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primary(context),
        selectionColor: AppColors.primary(context).withOpacity(0.35),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Colors.transparent,
        color: AppColors.primary(context),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary(context),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          // fontSize: ScreenUtil().setSp(38), // 16 by figma
          fontSize: 16.sp,
          color: AppColors.black,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.black,
        ),
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(AppColors.primary(context)),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          return states.any((element) => element == WidgetState.selected)
              ? AppColors.primary(context)
              : Colors.transparent;
        }),
        side: BorderSide(
          color: AppColors.primary(context),
          width: 2.w,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
      ),
    );

ThemeData APP_THEME_DARK(BuildContext context) => ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.gray,
      primaryColor: AppColors.primary(context),
      primaryColorLight: Color(0xFFE7EBFF),
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: GoogleFonts.latoTextTheme(),
    );
