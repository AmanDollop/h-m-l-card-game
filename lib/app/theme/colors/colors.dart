import 'package:flutter/material.dart';

abstract class CL{

  /* --------------------------Primary Colors Collection--------------------------*/
  Color get primary;

  Color get onPrimary;

  Color get primaryColor;

  /* --------------------------Secondary Colors Collection--------------------------*/
  Color get secondary;

  Color get secondaryColor;

  /* --------------------------Error / DisabledColor/ IndicatorColor Colors Collection--------------------------*/
  Color get errorColor;

  Color get error;

  /* --------------------------Success Colors Collection--------------------------*/

  Color get success;

  Color get onSuccess;

  /* --------------------------Text Colors Collection--------------------------*/
  Color get text;

  Color get onText;

  Color get textGrayColor;

  /* --------------------------NormalColors Colors Collection--------------------------*/

  Color get darkGreyColor;

  Color get lightGreyColor;

  Color get whiteColor;

  Color get blackColor;

  Color get purpleColor;

  Color get lightPurpleColor;

}

class LightThemeColor extends CL{

  @override
  Color get error => const Color(0xffE81B27);

  @override
  Color get errorColor => const Color(0xffFF535D);

  @override
  Color get onSuccess => throw UnimplementedError();

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get primary => const Color(0xff173FC8);

  @override
  Color get onPrimary => const Color(0xff0258AC);

  @override
  Color get primaryColor => const Color(0xff6A30A5);

  @override
  Color get secondary => const Color(0xffFFCD3B);

  @override
  Color get secondaryColor => const Color(0xffFFAF2B);

  @override
  Color get success => const Color(0xff16F111);

  @override
  Color get text => const Color(0xff300000);

  @override
  Color get textGrayColor => const Color(0xff858585);

  @override
  Color get darkGreyColor => const Color(0xffB0B0B0);

  @override
  Color get lightGreyColor => const Color(0xffF6F6F6);

  @override
  Color get blackColor => const Color(0xff000000);

  @override
  Color get whiteColor => const Color(0xffFFFFFF);

  @override
  Color get purpleColor => const Color(0xff6A30A5);

  @override
  Color get lightPurpleColor => const Color(0xff9B67D0);

}