import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class Cw {


  static Widget commonBgView({required Widget widget}) => Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        ImagePathConst.scaffoldBackgroundImg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      widget
    ],
  );

  /* --------------------------Buttons View--------------------------*/
  static Widget commonElevatedButton(
      {double? height,
      double? width,
      double? progressBarHeight,
      double? progressBarWidth,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      double? borderRadius,
      Color? splashColor,
      Color? buttonColor,
      double? elevation,
      bool isContentSizeButton = true,
      required VoidCallback onPressed,
      Widget? child,
      String buttonBgPath = '',
      String? buttonText,
      double? fontSize,
      Color? buttonTextColor,
      bool isRedBgImg = false,
      bool isLoading = false}) {
    return Container(
      height: height ?? 80.px,
      width: width ?? 302.px,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ??  40.px),
        image: DecorationImage(
          image: AssetImage(
            buttonBgPath == ''
              ? isRedBgImg
              ? ImagePathConst.rButtonBgImg
              : ImagePathConst.yButtonBgImg
              : buttonBgPath,
          ),
        )
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 40.px),
          ),
          backgroundColor: buttonColor,
          minimumSize: Size(
            width ?? /*312.px*/ 302.px,
            height ?? 80.px,
          ),
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: progressBarHeight ?? 24.px,
                  width: progressBarWidth ?? 24.px,
                  child: commonProgressBarView(
                      color: Theme.of(Get.context!).colorScheme.inversePrimary),
                ),
              )
            : child ??
                Text(
                  buttonText ?? '',
                  style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(fontSize: fontSize ?? 26.px, color: buttonTextColor),
                ),
      ),
    );
  }

  /* --------------------------Progress Bar View--------------------------*/
  static commonProgressBarView(
          {Color? color,
          Color? backgroundColor,
          double? value,
          double? strokeWidth,
          double? width,
          double? height,
          String? progressTextValue}) =>
      Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: CircularProgressIndicator(
                backgroundColor: backgroundColor ??
                    Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
                color: color ?? Theme.of(Get.context!).colorScheme.primary,
                value: value,
                strokeWidth: strokeWidth ?? 3,
                strokeCap: StrokeCap.round,
              ),
            ),
            Text(
              progressTextValue ?? '',
              style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  static Widget commonTextFormField({
    TextEditingController? controller,
    required String title,
    String? hintText,
    FocusNode? focusNode,
    bool filled = true,
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    EdgeInsetsGeometry? contentPadding,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    Widget? suffixIcon,
    Widget? prefixIcon,
    EdgeInsetsGeometry? suffixPadding,
    EdgeInsetsGeometry? prefixPadding,
    int? maxLength,
    bool obscureText = false,
    bool autofocus = false,
    String? hideTextCharacter,
    GestureTapCallback? onTap,
  }) {
    return SizedBox(
      width: 280.px,
      child: TextFormField(
        onTap: onTap,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        inputFormatters: keyboardType == TextInputType.number
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : inputFormatters,
        onChanged: keyboardType == TextInputType.number
            ? onChanged ?? (value) {}
            : onChanged ?? (value) {
          value = value.trim();
          if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
            controller?.text = "";
          }
        },
        keyboardType: keyboardType,
        validator: validator,
        readOnly: readOnly,
        controller: controller,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 28.px,
          color: LightThemeColor().whiteColor
        ),
        maxLength: maxLength,
        autofocus: autofocus,
        obscuringCharacter: hideTextCharacter ?? '•',
        cursorColor: LightThemeColor().secondaryColor,
        cursorWidth: 3.px,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          labelText: title,
          labelStyle: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: LightThemeColor().darkGreyColor,
          ),
          fillColor: LightThemeColor().blackColor.withOpacity(.2),
          filled: filled,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 30.px,vertical: 16.px),
          hintStyle: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: LightThemeColor().darkGreyColor,
            fontSize: 28.px
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: suffixPadding ?? EdgeInsets.zero,
            child: suffixIcon,
          )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: prefixPadding ?? EdgeInsets.zero,
            child: prefixIcon,
          )
              : null,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: LightThemeColor().secondaryColor, width: 2.px),
            borderRadius: BorderRadius.circular(35.px),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: LightThemeColor().secondaryColor,
                width: 2.px),
            borderRadius: BorderRadius.circular(35.px),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(Get.context!).colorScheme.error, width: 2.px),
            borderRadius: BorderRadius.circular(35.px),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: LightThemeColor().secondaryColor,
                width: 2.px),
            borderRadius: BorderRadius.circular(35.px),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: LightThemeColor().secondaryColor, width: 2.px),
            borderRadius: BorderRadius.circular(35.px),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(Get.context!).colorScheme.error, width: 2.px),
            borderRadius: BorderRadius.circular(35.px),
          ),
        ),
      ),
    );
  }


  static Widget appLogoView({double? w,double? h}) => SizedBox(
    width: w ?? double.infinity,
    height: h,
    child: Center(
      child: Image.asset(
        ImagePathConst.logoImg,
        width: w ?? double.infinity,
        height: h,
        fit: BoxFit.contain,
      ),
    ),
  );

  static Widget commonNetworkImageView({
    required String path,
    bool isAssetImage = true,
    double? height,
    double? width,
    double? radius,
    Color? color,
    BoxFit fit = BoxFit.contain,
    GestureTapCallback? onTap,
    ImageLoadingBuilder? loadingBuilder,
    String? errorImage,
  }) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius ?? 0.px),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 0.px),
          child: isAssetImage
              ? Image.asset(
            path,
            height: height,
            width: width,
            color: color,
            fit: fit,
          )
              : Image.network(
            path,
            height: height,
            width: width,
            color: color,
            fit: fit,
            loadingBuilder: loadingBuilder ?? (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: SizedBox(
                  height: 16.px,
                  width: 16.px,
                  child: Center(
                    child: commonProgressBarView(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                errorImage ?? 'assets/image/default_image.jpg',
                height: height,
                width: width,
                color: color,
                fit: fit,
              );
            },
          ),
        ),
      );



  static Widget commonDividerView(
      {Color? color,
        double? height,
        double? wight,
        double? leftPadding,
        double? rightPadding}) =>
      Divider(
        color: color ?? LightThemeColor().whiteColor,
        height: height ?? 10.px,
        thickness: wight ?? .5.px,
        endIndent: rightPadding,
        indent: leftPadding,
      );

  static Widget commonShimmerViewForImage(
      {double? width,
        double? height,
        double? radius,
        required BuildContext context,
        Duration? duration,
        Color? backgroundColor,
        Color? movementColor}) {
    bool isDark = true;
    if (Theme.of(context).brightness == Brightness.light) isDark = false;
    return Shimmer.fromColors(
      period: duration ?? const Duration(milliseconds: 2000),
      baseColor: backgroundColor ??
          (isDark
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2)),
      highlightColor: movementColor ?? Theme.of(context).colorScheme.surface.withOpacity(0.02),
      enabled: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDark
              ? Theme.of(context).primaryColor
              : Theme.of(context)
              .colorScheme
              .background, //without this color shimmer not work
          borderRadius: BorderRadius.circular(radius ?? 5.px),
        ),
      ),
    );
  }

}
