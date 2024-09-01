import 'package:flutter/material.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:hi_matchem_lo_card_game/app/theme/text_style/text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppThemeData{

  static ThemeData kNPThemeData({String? fontFamily}){

    return ThemeData(
      fontFamily : fontFamily,
      textTheme : TextThemeLight().myTextStyle(fontFamily: fontFamily),
      primaryColor: LightThemeColor().primary,
      scaffoldBackgroundColor: LightThemeColor().primary.withOpacity(.5),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: LightThemeColor().primary,
          onPrimary: LightThemeColor().primaryColor,
          secondary: LightThemeColor().secondary,
          onSecondary: LightThemeColor().secondaryColor,
          error: LightThemeColor().error,
          onError: LightThemeColor().errorColor,
          background: LightThemeColor().primary,
          onBackground: LightThemeColor().primary,
          surface: LightThemeColor().lightGreyColor,
          onSurface: LightThemeColor().darkGreyColor,
          inversePrimary: LightThemeColor().whiteColor,
          inverseSurface: LightThemeColor().blackColor,
          onInverseSurface: LightThemeColor().textGrayColor,
          tertiary: LightThemeColor().purpleColor,
          onTertiary: LightThemeColor().success
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.px),
            ),
            minimumSize: Size(double.infinity, 52.px),
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.px,color: LightThemeColor().primary),
            borderRadius: BorderRadius.circular(32.px),
          ),
          minimumSize: Size(312.px, 52.px),
        )
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: LightThemeColor().primary,
        circularTrackColor: LightThemeColor().darkGreyColor,
      ),
    );

  }

}