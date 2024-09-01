import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/learn_controller.dart';

class LearnView extends GetView<LearnController> {
  const LearnView({super.key});
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
                          SizedBox(
                            height: 510.px,
                            child: commonContainerView(
                              padding: EdgeInsets.all(20.px),
                              widget: Column(
                                children: [
                                  Expanded(
                                    child: PageView.builder(
                                      controller: controller.pageController,
                                      itemCount: controller.cardDataList.length,
                                      onPageChanged: (value) {
                                        controller.currentPageIndexValue.value = value;
                                        controller.count.value;
                                      },
                                      itemBuilder: (context, pIndex) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller.cardDataList[pIndex].length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                titleTextView(text: controller.cardDataList[pIndex][index]['title'] ??''),
                                                SizedBox(height: 6.px),
                                                Text(
                                                  controller.cardDataList[pIndex][index]['detail'] ??'',
                                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: ConstVar.arialFontFamily),
                                                ),
                                                SizedBox(height: 20.px),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 58.px,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        fullRulesButtonView(),
                                        SizedBox(width: 10.px),
                                        nextButtonView()
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
      titleTextView(text: 'Learn',maxLines: 1),
      homeButtonView()
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

  Widget homeButtonView() => InkWell(
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
          path: IconConst.homeIc,
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

  Widget fullRulesButtonView() => Cw.commonElevatedButton(
      onPressed: () => controller.clickOnFullRulesButton(),
      buttonText: 'Full Rules',
      fontSize: 16.px,
      height: 60.px,
      width: 136.px
  );

  Widget nextButtonView() => Cw.commonElevatedButton(
      onPressed: () => controller.clickOnNextButton(),
      buttonText: 'Next',
      fontSize: 16.px,
      height: 60.px,
      width: 136.px
  );

}
