import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/modules/player_wins_all_ties/controllers/player_wins_all_ties_controller.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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

                  ///Todo for version 2
                  cardView(),
                  // SizedBox(height: 10.px),
                  // horizontalCardListView(),
                  // SizedBox(height: 16.px),
                  SizedBox(height: 80.px),

                  Cw.appLogoView(w: 250.px),
                  SizedBox(height: 10.px),
                  playButtonView(),
                  SizedBox(height: 10.px),
                  learnButtonView(),
                  SizedBox(height: 10.px),
                  findLiveGameButtonView(),

                  ///Todo for version 2
                  // SizedBox(height: 10.px),
                  // if(controller.addBannerShowValue.value)
                  // Cw.commonNetworkImageView(
                  //   path: ImagePathConst.addBannerImg,
                  //   height: 92.px,
                  //   width: double.infinity
                  // ),

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
        // Row(
        //   children: [
        //     profileView(),
        //     Expanded(
        //       child: titleTextView(text: 'PLAYER',maxLines: 1),
        //     ),
        //     settingButtonView(),
        //   ],
        // ),
        Row(
          children: [
            profileView(),
            titleTextView(text: 'PLAYER', fontSize: 20.px),
            const Spacer(),
            Cw.commonNetworkImageView(
                path: ImagePathConst.coinImg, height: 16.px, width: 16.px),
            titleTextView(text: ' ${walletCoinValue.value}', fontSize: 18.px),
            SizedBox(width: 10.px),
            settingButtonView(),
          ],
        ),
        // SizedBox(height: 14.px),
        // Row(
        //   children: [
        //     Flexible(
        //       child: Column(
        //         children: [
        //           commonRowForCard(img: IconConst.flashIc,title: '2/3'),
        //           SizedBox(height: 10.px),
        //           commonRowForCard(img: IconConst.watchIc,title: '2:54:00'),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       width: 3.px,
        //       height: 70.px,
        //       margin: EdgeInsetsDirectional.symmetric(horizontal: 20.px),
        //       decoration: BoxDecoration(
        //           color: LightThemeColor().secondaryColor,
        //           borderRadius: BorderRadius.circular(1.5.px)
        //       ),
        //     ),
        //     Flexible(
        //       child: Column(
        //         children: [
        //           commonRowForCard(img: ImagePathConst.coinImg,title: '1,000'),
        //           SizedBox(height: 10.px),
        //           commonRowForCard(img: IconConst.diamondIc,title: '1,000'),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 14.px),
        // Row(
        //   children: [
        //     titleTextView(text: '8',fontSize: 22.px),
        //     Expanded(
        //       child: Container(
        //         height: 26.px,
        //         margin: EdgeInsets.only(left: 14.px,right: 30.px),
        //         decoration: BoxDecoration(
        //             color: LightThemeColor().secondaryColor,
        //             borderRadius: BorderRadius.circular(10.px)
        //         ),
        //       ),
        //     )
        //   ],
        // ),
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

  Widget horizontalCardListView() => SizedBox(
    height: 78.px,
    child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.cardImgList.length,
        scrollDirection: Axis.horizontal,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 10.px),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index != 3?12.px:0.px),
            child: Container(
              height: 78.px,
              width: 78.px,
              decoration: BoxDecoration(
                  color: LightThemeColor().text.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10.px)
              ),
              child: Center(
                child: Cw.commonNetworkImageView(
                  path: controller.cardImgList[index],
                  height: 50.px,
                  width: 50.px,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );

  Widget playButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnPlayButton(),
    buttonText: 'Play',
  );

  Widget learnButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnLearnButton(),
    buttonText: 'Learn',
  );

  Widget findLiveGameButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnFindLiveGameButton(),
    buttonText: 'Find Live Game',
  );

}


