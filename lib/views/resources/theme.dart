import 'package:domino/views/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primarySwatch: Colors.purple,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    // ripple effect color
    // cardview resources
    scaffoldBackgroundColor: ColorManager.white,
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: 4),
    // app bar resources
    appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManager.white,
      statusBarIconBrightness: Brightness.dark,
    ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorManager.primary,
size: 30        ),
        color: ColorManager.white,
        elevation: 0,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
        TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: ColorManager.primary)),
    // button resources
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
                color: ColorManager.white, fontSize: 17),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),

    textTheme: TextTheme(
        displayLarge:
        TextStyle(color: ColorManager.white, fontSize: 22),
        headlineLarge: TextStyle(
            color: ColorManager.darkGrey, fontSize: 16),
        titleMedium:
        TextStyle(color: ColorManager.black, fontSize: 14),
        bodyLarge: TextStyle(color: ColorManager.grey1),
        bodySmall: TextStyle(color: ColorManager.grey)),

    // input decoration resources (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
        contentPadding:const EdgeInsets.all(8),
        // hint style
        hintStyle:
        TextStyle(color: ColorManager.grey, fontSize: 14),
        labelStyle:
        TextStyle(color: ColorManager.primary, fontSize: 14),
        errorStyle: TextStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.grey, width:1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8)))),
    // label style
  );
}