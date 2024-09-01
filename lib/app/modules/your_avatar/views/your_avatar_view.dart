import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/your_avatar_controller.dart';

class YourAvatarView extends GetView<YourAvatarController> {
  const YourAvatarView({super.key});

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
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.px),
                children: [
                  SizedBox(height: 16.px),
                  titleTextView(text: 'Enter User Name'),
                  SizedBox(height: 18.px),
                  enterUserNameTextFieldView(),
                  SizedBox(height: 18.px),
                  titleTextView(text: 'Your Avatar'),
                  SizedBox(height: 18.px),
                  avatarView(),
                  SizedBox(height: 25.px),
                  titleTextView(text: 'Preview'),
                  SizedBox(height: 10.px),
                  previewView(),
                  SizedBox(height: 40.px),
                  continueButtonView(),
                  SizedBox(height: 10.px),
                  cancelButtonView(),
                  SizedBox(height: 16.px),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleTextView({required String text}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(color: LightThemeColor().whiteColor,fontSize: 28.px),
  );

  Widget enterUserNameTextFieldView() => Cw.commonTextFormField(
    title: 'Enter User Name',
    hintText: 'Enter User Name',
  );

  Widget avatarView() => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.cardImgList.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      mainAxisSpacing: 10.px,
      crossAxisSpacing: 10.px,
    ),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () => controller.clickOnAvatarView(index: index),
        child: Container(
          decoration: BoxDecoration(
              color: controller.selectAvatar.value == controller.cardImgList[index]
                  ? LightThemeColor().blackColor.withOpacity(.2)
                  : LightThemeColor().whiteColor,
              borderRadius: BorderRadius.circular(10.px),
              border: controller.selectAvatar.value == controller.cardImgList[index]
                  ? Border.all(
                  color: LightThemeColor().secondaryColor,
                  width: 3.px
              )
                  : Border.all(
                  color: Colors.transparent,
                  width: 0.px
              )
          ),
          child: Center(
            child: Cw.commonNetworkImageView(
              path: controller.cardImgList[index],
              width: 30.px,
              height: 50.px,
            ),
          ),
        ),
      );
    },
  );

  Widget previewView() => Container(
    padding: EdgeInsets.all(25.px),
    decoration: BoxDecoration(
        color: LightThemeColor().blackColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(20.px),
        border: Border.all(
            color: LightThemeColor().secondaryColor,
            width: 2.px
        )
    ),
    child: Row(
      children: [
        Container(
          height: 64.px,
          width: 64.px,
          margin: EdgeInsets.only(right: 20.px),
          decoration: BoxDecoration(
           color: LightThemeColor().whiteColor,
           shape: BoxShape.circle
          ),
          child: Center(
            child: Cw.commonNetworkImageView(
              path: controller.selectAvatar.value,
              width: 32.px,
              height: 46.px,
            ),
          ),
        ),
        titleTextView(text: 'PLAYER')
      ],
    ),
  );

  Widget continueButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnContinueButton(),
    buttonText: 'Continue',
  );

  Widget cancelButtonView() => Cw.commonElevatedButton(
    onPressed: () => Get.back(),
    buttonText: 'Cancel',
    buttonTextColor: LightThemeColor().whiteColor,
    isRedBgImg: true,
  );

}
