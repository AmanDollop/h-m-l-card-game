import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});
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
                  cardView(),
                  SizedBox(height: 30.px),
                  storeView(),
                  SizedBox(height: 30.px),
                  cardList(),
                  SizedBox(height: 6.h),
                  homeButtonView(),
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

  Widget cardView() => Container(
    padding: EdgeInsets.all(14.px),
    decoration: BoxDecoration(
        color: LightThemeColor().blackColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(20.px),
        border: Border.all(
            color: LightThemeColor().secondaryColor,
            width: 2.px
        )
    ),
    child: Column(
      children: [
        Row(
          children: [
            profileView(),
            Expanded(
              child: titleTextView(text: 'PLAYER',maxLines: 1),
            ),
            settingButtonView(),
          ],
        ),
        SizedBox(height: 14.px),
        Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  commonRowForCard(img: IconConst.flashIc,title: '2/3'),
                  SizedBox(height: 10.px),
                  commonRowForCard(img: IconConst.watchIc,title: '2:54:00'),
                ],
              ),
            ),
            Container(
              width: 3.px,
              height: 70.px,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 20.px),
              decoration: BoxDecoration(
                  color: LightThemeColor().secondaryColor,
                  borderRadius: BorderRadius.circular(1.5.px)
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  commonRowForCard(img: ImagePathConst.coinImg,title: '1,000'),
                  SizedBox(height: 10.px),
                  commonRowForCard(img: IconConst.diamondIc,title: '1,000'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 14.px),
        Row(
          children: [
            titleTextView(text: '8',fontSize: 22.px),
            Expanded(
              child: Container(
                height: 26.px,
                margin: EdgeInsets.only(left: 14.px,right: 30.px),
                decoration: BoxDecoration(
                    color: LightThemeColor().secondaryColor,
                    borderRadius: BorderRadius.circular(10.px)
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );

  Widget profileView() => Container(
    height: 50.px,
    width: 50.px,
    margin: EdgeInsets.only(right: 20.px),
    decoration: BoxDecoration(
        color: LightThemeColor().whiteColor,
        shape: BoxShape.circle
    ),
    child: Center(
      child: Cw.commonNetworkImageView(
        path: 'assets/avatar_img/a6.png',
        width: 25.px,
        height: 34.px,
      ),
    ),
  );

  Widget settingButtonView() => InkWell(
    onTap: () => Get.toNamed(Routes.SETTING),
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
          path: IconConst.settingIc,
          width: 24.px,
          height: 24.px,
        ),
      ),
    ),
  );

  Widget commonRowForCard({required String img, required String title}) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Center(
        child: Cw.commonNetworkImageView(
          path: img,
          width: 30.px,
          height: 30.px,
        ),
      ),
      SizedBox(width: 10.px),
      Flexible(
        child: titleTextView(text: title,maxLines: 1,fontSize: 22.px),
      ),
    ],
  );

  Widget commonContainerView({required Widget widget}) => Container(
    padding: EdgeInsets.all(14.px),
    decoration: BoxDecoration(
      color: LightThemeColor().blackColor.withOpacity(.2),
      borderRadius: BorderRadius.circular(20.px),
      border: Border.all(
        color: LightThemeColor().secondaryColor,
        width: 2.px,
      ),
    ),
    child: widget,
  );

  Widget buildDiamond() {
    return Container(
      width: 18.px,
      height: 18.px,
      transform: Matrix4.rotationZ(0.8), // Rotate 45 degrees
      decoration: BoxDecoration(
       color: LightThemeColor().secondary,
       borderRadius: BorderRadius.circular(2.px),
        boxShadow: [
          BoxShadow(
            color: LightThemeColor().blackColor.withOpacity(.2),
            blurRadius: 4.px
          )
        ]
      ),
    );
  }

  Widget storeView()=> Stack(
    alignment: Alignment.center,
    children: [
      Center(
        child: Container(
          width: double.infinity,
          height: 4.px,
          margin: EdgeInsetsDirectional.only(end: 16.px,start: 16.px,top: 10.px),
          color: LightThemeColor().secondary,
        ),
      ),
      Row(
        children: [
          SizedBox(width: 16.px),
          buildDiamond(),
          SizedBox(width: 10.px),
          buildDiamond(),
          Cw.commonElevatedButton(
            onPressed: (){},
            buttonBgPath: ImagePathConst.bButtonBgImg,
            buttonText: 'Store',
            buttonTextColor: LightThemeColor().whiteColor,
            fontSize: 20.px,
            width: 200.px,
            height: 44.px
          ),
          const Spacer(),
          buildDiamond(),
          SizedBox(width: 10.px),
          buildDiamond(),
        ],
      )
    ],
  );

  Widget cardList() {
    return ListView.builder(
      itemCount: controller.data.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.px),
          child: commonContainerView(
            widget: Row(
              children: [
                titleTextView(text: '${controller.data[index]['CardName']}  +  ', fontSize: 18.px),
                Cw.commonNetworkImageView(path: ImagePathConst.coinImg, height: 18.px, width: 18.px),
                Expanded(
                  child: titleTextView(
                    text: ' ${controller.data[index]['CardAmount']}',
                    fontSize: 18.px,
                  ),
                ),
                Container(
                  height: 47.px,
                  width: 100.px,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 24.px,vertical: 10.px),
                  decoration: BoxDecoration(
                   image:  const DecorationImage(
                    image: AssetImage(ImagePathConst.yButtonBg1Img),
                    fit: BoxFit.contain
                   ),
                   borderRadius: BorderRadius.circular(10.px)
                  ),
                  child: Center(
                    child: Text(
                      '${controller.data[index]['InDollar']}',
                      style: Theme.of(Get.context!).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget homeButtonView() => Cw.commonElevatedButton(
    onPressed: () => Get.offAllNamed(Routes.HOME),
    buttonText: 'Home',
  );

}
