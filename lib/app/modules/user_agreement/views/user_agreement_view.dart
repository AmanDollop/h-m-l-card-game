import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/user_agreement_controller.dart';

class UserAgreementView extends GetView<UserAgreementController> {
  const UserAgreementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Cw.commonBgView(
          widget: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.px),
          children: [
            SizedBox(height: 16.px),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20.px,right: 20.px, top: 30.px,bottom: 20.px),
              decoration: BoxDecoration(
                color: LightThemeColor().blackColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(20.px),
                border: Border.all(
                  color: LightThemeColor().secondaryColor,
                  width: 2.px,
                ),
              ),
              child: Column(
                children: [
                  userAgreementTextView(),
                  SizedBox(height: 18.px),
                  agreementDetailTextView(),
                  SizedBox(height: 22.px),
                  agreeButtonView(),
                  SizedBox(height: 10.px),
                  cancelButtonView(),
                ],
              ),
            ),
            SizedBox(height: 16.px),
          ],
        ),
      )),
    );
  }

  Widget userAgreementTextView() => Text(
    'User Agreement',
    style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(color: LightThemeColor().secondaryColor,fontSize: 28.px),
  );

  Widget agreementDetailTextView() => Text(
    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
    style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(
      fontSize: 16.px,
      fontFamily: ConstVar.arialFontFamily
    ),
  );

  Widget agreeButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnAgreeButton(),
    buttonText: 'Agree',
  );

  Widget cancelButtonView() => Cw.commonElevatedButton(
    onPressed: () => Get.back(),
    buttonText: 'Cancel',
    buttonTextColor: LightThemeColor().whiteColor,
    isRedBgImg: true,
  );

}
