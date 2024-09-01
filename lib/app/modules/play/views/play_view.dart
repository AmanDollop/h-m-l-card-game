import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Cw.commonBgView(
            widget: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                children: [
                  SizedBox(height: 16.px),
                  titleTextView(text: 'Play page not working'),
                  SizedBox(height: 16.px),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleTextView({required String text,int? maxLines,double? fontSize}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
          color: LightThemeColor().whiteColor,
          fontSize: fontSize ?? 24.px
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

}
