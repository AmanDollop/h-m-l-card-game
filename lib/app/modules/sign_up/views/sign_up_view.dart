import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Cw.commonBgView(
        widget: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.px),
          children: [
            SizedBox(height: 16.px),
            Cw.appLogoView(),
            SizedBox(height: 20.px),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 40.px),
                  padding: EdgeInsets.only(left: 20.px,right: 20.px, top: 30.px,bottom: 20.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    border: Border.all(
                      color: LightThemeColor().secondaryColor,
                      width: 2.px,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50.px),
                      emailTextFieldView(),
                      SizedBox(height: 14.px),
                      passwordTextFieldView(),
                      SizedBox(height: 40.px),
                      signUpButtonView(),
                      SizedBox(height: 5.px),
                      cancelButtonView(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.px, right: 30.px),
                  child: Cw.commonNetworkImageView(
                    path: ImagePathConst.emailFramImg,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.px),
          ],
        ),
      )),
    );
  }

  Widget emailTextFieldView() => Cw.commonTextFormField(
    title: 'Email',
    hintText: 'Email',
  );

  Widget passwordTextFieldView() => Cw.commonTextFormField(
    title: 'Password',
    hintText: 'Password',
  );

  Widget signUpButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnSignUpButton(),
    buttonText: 'Sign Up',
  );

  Widget cancelButtonView() => Cw.commonElevatedButton(
    onPressed: () => Get.back(),
    buttonText: 'Cancel',
    buttonTextColor: LightThemeColor().whiteColor,
    isRedBgImg: true,
  );

}
