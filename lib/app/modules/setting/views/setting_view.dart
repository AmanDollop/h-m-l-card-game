import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        controller.count.value;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Cw.commonBgView(
            widget: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  children: [
                    SizedBox(height: 16.px),
                    appBarView(),
                    SizedBox(height: 16.px),
                    Expanded(
                      child: ListView(
                        children: [
                          commonContainerView(
                            padding: EdgeInsets.all(34.px),
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*commonRowForCard(
                                  title: 'Sound Effects',
                                  isIconValue: false,
                                  widget: CustomSwitch(
                                    value: controller.soundEffectValue.value,
                                    onChanged: (value) {
                                      controller.soundEffectValue.value = !controller.soundEffectValue.value;
                                      controller.count.value++;
                                    },
                                  ),
                                ),
                                commonDividerView(),

                                 */
                                commonRowForCard(
                                  title: 'Notifications',
                                  isIconValue: false,
                                  widget: CustomSwitch(
                                    value: controller.notificationValue.value,
                                    onChanged: (value) {
                                      controller.notificationValue.value = !controller.notificationValue.value;
                                      controller.count.value++;
                                    },
                                  ),
                                ),
                                commonDividerView(),
                                commonRowForCard(title: 'Read the Rules'),
                                commonDividerView(),
                                commonRowForCard(title: 'Contact Us'),
                                commonDividerView(),
                                commonRowForCard(title: 'Privacy Policy',color: LightThemeColor().secondaryColor),
                                commonDividerView(),
                                commonRowForCard(title: 'Terms of Service',color: LightThemeColor().secondaryColor),
                                commonDividerView(),
                                commonRowForCard(title: 'Version',color: LightThemeColor().secondaryColor),
                                SizedBox(height: 2.px),
                                titleTextView(text: '1.0.0', color: LightThemeColor().secondaryColor, fontSize: 18.px)
                              ],
                            ),
                          ),
                          SizedBox(height: 26.px),
                          Center(
                            child: titleTextView(text: 'How To Play'),
                          ),
                          SizedBox(height: 16.px),
                          Cm.videoView(url: 'https://www.youtube.com/watch?v=PljDuynF-j0',youtubePlayerController: controller.youtubePlayerController),
                          SizedBox(height: 16.px),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleTextView({required String text,int? maxLines,double? fontSize,Color? color}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
     color: color ?? LightThemeColor().whiteColor,
     fontSize: fontSize ?? 24.px
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );

  Widget appBarView() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      backButtonView(),
      titleTextView(text: 'Setting',maxLines: 1),
      SizedBox(width: 30.px)
    ],
  );

  Widget backButtonView() => InkWell(
    onTap: () => Get.back(),
    borderRadius: BorderRadius.circular(10.px),
    child: Container(
      height: 40.px,
      width: 40.px,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagePathConst.ySquareButtonBgImg),
              fit: BoxFit.contain
          )
      ),
      child: Center(
        child: Cw.commonNetworkImageView(
          path: IconConst.backIc,
          width: 18.px,
          height: 18.px,
        ),
      ),
    ),
  );

  Widget commonContainerView({required Widget widget,EdgeInsetsGeometry? padding}) => Container(
    padding: padding,
    decoration: BoxDecoration(
        color: LightThemeColor().blackColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(20.px),
        border: Border.all(
         color: LightThemeColor().secondaryColor,
         width: 2.px
       )
    ),
    child: widget,
  );

  Widget commonRowForCard({required String title,Color? color,bool isIconValue = true,Widget? widget}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: titleTextView(text: title,maxLines: 1,color: color),
      ),
      isIconValue
          ? Icon(Icons.keyboard_arrow_right_outlined,color: color ?? LightThemeColor().whiteColor,size: 26.px,)
          : widget ?? const SizedBox(),
    ],
  );

  Widget commonDividerView() => Column(
    children: [
      SizedBox(height: 10.px),
      Cw.commonDividerView(),
      SizedBox(height: 10.px),
    ],
  );
}

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40.px,
            height: 20.px,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: value
                  ? LightThemeColor().success.withOpacity(.6)
                  : LightThemeColor().whiteColor.withOpacity(.6),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 22.px,
            height: 22.px,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value ? LightThemeColor().success : LightThemeColor().whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ],
            ),
            transform: Matrix4.translationValues(
              value ? 8.px : -8.px,
              0.0,
              0.0,
            ),
          ),
        ],
      ),
    );
  }
}