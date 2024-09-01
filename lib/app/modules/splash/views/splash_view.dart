import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return Scaffold(
          body: Cw.commonBgView(
            widget: Padding(
              padding: EdgeInsets.all(16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cw.appLogoView(),
                  gamingTextView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget gamingTextView() => Text(
    '3JGaming',
    style: Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(fontSize: 26.px),
  );

}
