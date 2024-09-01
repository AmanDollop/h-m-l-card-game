import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Cw.commonBgView(
        widget: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
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
                            width: 2.px
                          )
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 40.px),

                            ///Todo for version 2
                            // gmailButtonView(),
                            // SizedBox(height: 16.px),
                            // emailButtonView(),
                            // SizedBox(height: 28.px),
                            // orView(),
                            // SizedBox(height: 50.px),

                            playAsGuestButtonView(),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 30.px,right: 30.px),
                        child: Cw.commonNetworkImageView(
                          path: ImagePathConst.signInFramImg,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.px),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget commonButtonView({required VoidCallback onPressed,required String path,required String buttonName}) => Cw.commonElevatedButton(
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50.px,
          width: 50.px,
          margin: EdgeInsets.only(right: 14.px),
          decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: LightThemeColor().text.withOpacity(.4)
          ),
          child:  Center(
            child: Cw.commonNetworkImageView(
              path:path,
              height: 32.px,
              width: 32.px,
            ),
          ),
        ),
        Text(
          buttonName,
          style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(fontSize: 26.px,),
        ),
        SizedBox(width: 30.px)
      ],
    ),
  );

  Widget gmailButtonView() => commonButtonView(
   onPressed: () => controller.clickOnEmailButton(),
   path: ImagePathConst.googleImg,
   buttonName: 'Gmail',
  );

  Widget emailButtonView() => commonButtonView(
    onPressed: () => controller.clickOnEmailButton(),
    path: ImagePathConst.emailImg,
    buttonName: 'Email'
  );

  Widget orView() => Cw.commonNetworkImageView(
    path: ImagePathConst.orImg,
    height: 40.px,
  );

  Widget playAsGuestButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnPlayAsGuestButton(),
    buttonText: 'Play As Guest',
  );

}
