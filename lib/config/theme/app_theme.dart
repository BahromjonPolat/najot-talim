import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nt/config/components/components.dart';
import 'package:nt/config/config.dart';

class AppTheme {
  static ThemeData getApplicationTheme() {
    return ThemeData(
      // main colors of the app
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.lightColor,
      fontFamily: AppTextStyle.URBANINST,
      canvasColor: AppColors.white,
      highlightColor: Colors.transparent,
      applyElevationOverlayColor: false,

      colorScheme: const ColorScheme.light(primary: AppColors.primary),

      // CARD THEME
      cardTheme: const CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        elevation: 0.0,
      ),

      dialogTheme: DialogTheme(shape: AppShapes.simple(radius: 16)),

      // App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        // elevation: 0.0,
        iconTheme: const IconThemeData(color: AppColors.white),
        shadowColor: AppColors.grey,
        titleTextStyle: AppTextStyle.medium(
          color: AppColors.white,
          size: 20.sp,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      // Button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColors.grey,
        buttonColor: AppColors.primary,
        splashColor: AppColors.primary.withOpacity(0.4),
      ),

      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.white,
      ),

      // outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(428.w, 48.h),
          textStyle: AppTextStyle.medium(color: AppColors.primary),
          primary: AppColors.primary,
          alignment: Alignment.center,
          side: BorderSide(color: AppColors.primary, width: 1.w),
          // shape: AppShapes.circular(),
        ),
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          textStyle: AppTextStyle.semiBold(color: AppColors.white, size: 15),
          backgroundColor: AppColors.primary,
          fixedSize: Size(348.w, 56.h),
          shape: AppShapes.simple(),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: AppColors.primary,
          textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        // backgroundColor: AppColors.PRIMARY,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10.h,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGrey,
        selectedLabelStyle: AppTextStyle.medium(size: 14),
        unselectedLabelStyle: AppTextStyle.medium(size: 14),
      ),

      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColors.white,
        labelColor: AppColors.white,
        labelStyle: AppTextStyle.medium(size: 16.0),
        unselectedLabelStyle: AppTextStyle.semiBold(size: 16.0),
        indicator: const UnderlineTabIndicator(),
      ),

      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.lightColor,
          // shape: AppShapes.topCircular(),
          constraints: BoxConstraints(maxHeight: 520.h)),

      dividerTheme:
          DividerThemeData(color: AppColors.lightColor, thickness: 1.h),

      dataTableTheme: DataTableThemeData(
          columnSpacing: 14.w,
          headingRowColor: MaterialStateProperty.all(AppColors.lightColor),
          decoration: const BoxDecoration()),

      scrollbarTheme: ScrollbarThemeData(
        crossAxisMargin: 6.w,
        interactive: false,
        thickness: MaterialStateProperty.all(8.w),
        trackBorderColor: MaterialStateProperty.all(AppColors.primary),
        thumbColor: MaterialStateProperty.all(AppColors.primary),
        trackColor: MaterialStateProperty.all(AppColors.blue),
        radius: Radius.circular(4.r),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        elevation: 0.0,
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(AppColors.white),
        fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
        // shape: AppShapes.circular(radius: 6.r),
      ),

      // TEXT THEME
      textTheme: TextTheme(
        headline1: AppTextStyle.medium(size: 32.0),
        headline2: AppTextStyle.medium(size: 24.0),
        headline3: AppTextStyle.regular(size: 20.0),
        headline4: AppTextStyle.regular(size: 18.0),
        headline5: AppTextStyle.regular(size: 15.0),
        subtitle1: AppTextStyle.medium(color: AppColors.black, size: 14.0),
        subtitle2: AppTextStyle.medium(color: AppColors.black, size: 14.0),
        bodyText1: AppTextStyle.regular(color: AppColors.black),
        bodyText2: AppTextStyle.medium(color: AppColors.black),
        caption: AppTextStyle.regular(color: AppColors.black),
      ),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        filled: true,
        fillColor: AppColors.fillColor,
        prefixStyle: AppTextStyle.medium(size: 16.sp),
        counterStyle: const TextStyle(fontSize: 0.0, height: 0.0),

        // hint style
        hintStyle: AppTextStyle.medium(size: 16.0, color: AppColors.grey),

        // label style
        labelStyle: AppTextStyle.medium(size: 16.sp),
        // error style
        errorStyle: AppTextStyle.regular(color: AppColors.red),

        // enabled border
        enabledBorder: _outlineInputBorder(AppColors.borderColor),

        // focused border
        focusedBorder: _outlineInputBorder(AppColors.borderColor),

        // error border
        errorBorder: _outlineInputBorder(AppColors.red),
        // focused error border
        focusedErrorBorder: _outlineInputBorder(AppColors.red),
      ),
    );
  }

  static OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
