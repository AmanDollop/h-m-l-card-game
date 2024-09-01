import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/modules/player_wins_all_ties/controllers/player_wins_all_ties_controller.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/card_screen_controller.dart';

class CardScreenView extends GetView<CardScreenController> {
  const CardScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        body: Cw.commonBgView(
          widget: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              children: [
                SizedBox(height: 16.px),
                buildUserProfile(context),
                SizedBox(height: 14.px),
                buildCardDisplay(),
                SizedBox(height: 6.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    titleTextView(text: 'Dealer’s Lo Hand', fontSize: 12.px),
                    SizedBox(width: 30.px),
                    titleTextView(text: 'Dealer’s Hi Hand', fontSize: 12.px),
                  ],
                ),
                SizedBox(height: 6.px),
                buildBettingSection(),
                SizedBox(height: 10.px),
                Obx(
                 () {
                    controller.count.value;
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: controller.isLastCardSelectValue.value
                          ? 190.px
                          : 100.px,
                      // color: Colors.red,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => controller.clickOnHighCard(text:'High'),
                                child: buildBetOption(label: 'High', value: 8),
                              ),
                              InkWell(
                                onTap: () => controller.clickOnLowCard(text: 'Low'),
                                child: buildBetOption(label: 'Low', value: 8, isRedCardValue: true),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: controller.isHighCardSelected.value == 'High'
                          //       ? 0.px
                          //       : 180.px,
                          // ),
                          for (int i = 0; i < controller.secondList.length; i++)
                            AnimatedPositioned(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              left:  controller.isHighCardSelected.value == 'High'
                                  ? 27.w + controller.cardOffsets[i].dx
                                  : controller.isHighCardSelected.value == 'Low'
                                  ? 48.w + controller.cardOffsets[i].dx
                                  : i != 0
                                  ? i * 70.px + 19.w
                                  : 19.w,
                              top: controller.isHighCardSelected.value == 'High'
                                  ? 2 + controller.cardOffsets[i].dy
                                  : controller.isHighCardSelected.value == 'Low'
                                  ? 2 + controller.cardOffsets[i].dy
                                  : 13.h,
                              child: GestureDetector(
                                // onTap: () => !controller.isCardSet[i]
                                //     ? controller.onCardTap(index: i)
                                //     : null,
                                child: Transform.scale(
                                  scale: 0.9,
                                  child: controller.isCardSet[i]
                                      ? Cw.commonNetworkImageView(
                                    path: controller.isCardSet[i]
                                        ? 'assets/cards_img/c_bg_img.png'
                                        : controller.cardList[i],
                                          height: 85,
                                          width: 60,
                                        )
                                  : commonContainerViewForCard(
                                    text: controller.secondList[i]['card'],
                                    height: 85,
                                    width: 60,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                // SizedBox(height: 10.px),
                Center(
                  child: Text(
                    'Player Wins All Ties',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LightThemeColor().secondaryColor,
                        letterSpacing: 0,
                        fontSize: 20.px),
                  ),
                ),
                SizedBox(height: 12.px),
                doubleDownButtonView(),
                SizedBox(height: 6.px),
                playButtonView(),
                SizedBox(height: 10.px),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget commonContainerViewForCard({required String text,double? height,double? width}) => Container(
    height: height ?? 70.px,
    width: width ?? 55.px,
    decoration: BoxDecoration(
      color: LightThemeColor().whiteColor,
      borderRadius: BorderRadius.circular(5.px)
    ),
    child: Center(
      child: Text(
        text,
        style: Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(
          color: LightThemeColor().blackColor
        ),
      ),
    ),
  );

  Widget titleTextView({required String text, int? maxLines, double? fontSize, Color? color}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(color: color ?? LightThemeColor().whiteColor, fontSize: fontSize),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
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

  Widget buildUserProfile(BuildContext context) {
    return commonContainerView(
      widget: Row(
        children: [
          profileView(),
          titleTextView(text: 'PLAYER', fontSize: 20.px),
          const Spacer(),
          Cw.commonNetworkImageView(path: ImagePathConst.coinImg, height: 16.px, width: 16.px),
          titleTextView(text: ' ${walletCoinValue.value}', fontSize: 18.px),
          SizedBox(width: 10.px),
          settingButtonView(),
        ],
      ),
    );
  }

  Widget profileView() => Container(
    height: 50.px,
    width: 50.px,
    margin: EdgeInsets.only(right: 20.px),
    decoration: BoxDecoration(color: LightThemeColor().whiteColor, shape: BoxShape.circle),
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
          fit: BoxFit.contain,
        ),
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

  Widget buildCardDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.firstList.length,
        (index) => index == 2
          ? Padding(
             padding: EdgeInsets.symmetric(horizontal: 12.px),
               child: Column(
                children: [
                 Container(
                  height: 10.px,
                  width: 3.px,
                  decoration: BoxDecoration(
                   color: LightThemeColor().whiteColor,
                    borderRadius: BorderRadius.only(
                     topRight: Radius.circular(2.px),
                     topLeft: Radius.circular(2.px),
                    ),
                   ),
                  ),
                  controller.topCardValue.value
                    ? commonContainerViewForCard(text: controller.firstList[index]['card'])
                    : Cw.commonNetworkImageView(
                     path: controller.topCardValue.value
                       ? controller.topCardList[index]
                       : 'assets/cards_img/c_bg_img.png',
                       // Replace with your card back asset
                       height: 70.px,
                       width: 55.px,
                     ),
                    Container(
                      height: 10.px,
                      width: 3.px,
                      decoration: BoxDecoration(
                        color: LightThemeColor().whiteColor,
                        borderRadius: BorderRadius.only(
                         bottomRight: Radius.circular(2.px),
                         bottomLeft: Radius.circular(2.px),
                       ),
                      ),
                    ),
                  ],
                ),
              )
            :  controller.topCardValue.value
            ? Padding(
              padding:  EdgeInsets.only(
                right: index == 0 ?10.px:0.px,
                left: index == 4 ?10.px:0.px
              ),
              child: commonContainerViewForCard(text: controller.firstList[index]['card']),
            )
            : Cw.commonNetworkImageView(
               path: controller.topCardValue.value
                ? controller.topCardList[index]
                : 'assets/cards_img/c_bg_img.png',
                // Replace with your card back asset
                height: 70.px,
                width: 55.px,
        ),
      ),
    );
  }

  Widget buildBettingSection() {
    return SizedBox(
      height: 90.px,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cardData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 90.px,
              width: 90.px,
              margin: EdgeInsets.only(right: index != 2 ? 20.px : 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: LightThemeColor().blackColor.withOpacity(.2),
                border: Border.all(
                  color: LightThemeColor().secondaryColor,
                  width: 2.px,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cardTitleData[index],
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: LightThemeColor().secondaryColor,
                        letterSpacing: 0,
                        height: -1,
                      ),
                    ).paddingOnly(top: 30.px, bottom: 2.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Cw.commonNetworkImageView(
                          path: ImagePathConst.coinImg,
                          height: 16.px,
                          width: 16.px,
                        ),
                        SizedBox(width: 5.px),
                        Text(
                          cardData[index].toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildBetOption({required String label, required int value, bool isRedCardValue = false}) => Column(
    children: [
      Container(
        height: 90.px,
        width: 80.px ,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isRedCardValue
                  ? ImagePathConst.redCardBgImg
                  : ImagePathConst.purpleCardBgImg1,
            ),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleTextView(text: label, fontSize: 16.px),
            SizedBox(height: 5.px),
            titleTextView(text: value.toString(), fontSize: 16.px),
          ],
        ),
      ),
    ],
  );

  Widget doubleDownButtonView() => GestureDetector(
    onDoubleTap: () => controller.clickOnDoubleDownButton(),
    child: Cw.commonElevatedButton(
      onPressed: () {},
      buttonText: 'Double Down',
      buttonBgPath: controller.doubleDownButtonValue.value
          ? 'assets/img/g_button_bg_img.png'
          : '',
      height: 68.px,
        fontSize: 22.px
    ),
  );

  Widget playButtonView() => Cw.commonElevatedButton(
    onPressed: () => controller.clickOnPlayButton(),
    buttonText: 'Play',
    height: 68.px,
    fontSize: 22.px
  );

}

/// TODO For First and second

//  Widget buildBetOption({required String label, required int value, bool isRedCardValue = false}) => Column(
//     children: [
//       Container(
//         height: isRedCardValue ? 80.px : 80.px,
//         width: isRedCardValue ? 80.px : 120.px,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               isRedCardValue
//                   ? ImagePathConst.redCardBgImg
//                   : ImagePathConst.purpleCardBgImg,
//             ),
//             fit: BoxFit.contain,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             titleTextView(text: label, fontSize: 16.px),
//             SizedBox(height: 5.px),
//             titleTextView(text: value.toString(), fontSize: 16.px),
//           ],
//         ),
//       ),
//     ],
//   );

/// TODO Second code


//    Obx(
//                     () {
//                     controller.count.value;
//                     return AnimatedContainer(
//                       duration: const Duration(seconds: 1),
//                       height: controller.isLastCardSelectValue.value
//                           ? 280.px
//                           : 180.px,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               InkWell(
//                                 onTap: () => controller.clickOnHighCard(text:'High'),
//                                 child: buildBetOption(label: 'High', value: 8),
//                               ),
//                               InkWell(
//                                 onTap: () => controller.clickOnLowCard(text: 'Low'),
//                                 child: buildBetOption(label: 'Low', value: 8, isRedCardValue: true),
//                               ),
//                             ],
//                           ),
//                           // SizedBox(
//                           //   height: controller.isHighCardSelected.value == 'High'
//                           //       ? 0.px
//                           //       : 180.px,
//                           // ),
//                           for (int i = 0; i < 3; i++)
//                             AnimatedPositioned(
//                               duration: const Duration(seconds: 1),
//                               curve: Curves.easeInOut,
//                               left: controller.isCardSet[i]
//                                   ? 150.px + controller.cardOffsets[i].dx
//                                   : i != 0
//                                   ? i * 80.px + 60.px
//                                   : 60.px,
//                               // top: controller.isCardSet[i]
//                               //     ? controller.cardOffsets[i].dy
//                               //     : 180.px,
//                               top: controller.isHighCardSelected.value == 'High'
//                                   ? 10.px
//                                   : controller.isHighCardSelected.value == 'Low'
//                                   ? 90.px
//                                   : 180.px,
//                               child: GestureDetector(
//                                 // onTap: () => !controller.isCardSet[i]
//                                 //     ? controller.onCardTap(index: i)
//                                 //     : null,
//                                 child: Transform.scale(
//                                   scale: 0.9,
//                                   child: Cw.commonNetworkImageView(
//                                     path: controller.isCardSet[i]
//                                         ? 'assets/cards_img/c_bg_img.png'
//                                         : controller.cardList[i],
//                                     height: 80,
//                                     width: 60,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),




/// TODO First code

///TODO old code
// void onCardTap({required int index})  {
//   isCardSet[index] = true;
//   if (isCardSet[0] && isCardSet[1] && isCardSet[2]) {
//     isLastCardSelectValue.value = false;
//   }
//   count.value++;
// }

//Obx(
//                       () {
//                     controller.count.value;
//                     return AnimatedContainer(
//                       duration: const Duration(seconds: 1),
//                       height: controller.isLastCardSelectValue.value
//                           ? 180.px
//                           : 100.px,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           buildBetOption(label: 'Low', value: 8, isRedCardValue: true),
//                           for (int i = 0; i < 3; i++)
//                             AnimatedPositioned(
//                               duration: const Duration(seconds: 1),
//                               curve: Curves.easeInOut,
//                               left: controller.isCardSet[i]
//                                   ? 150.px + controller.cardOffsets[i].dx
//                                   : i * 80.px + 60.px,
//                               top: controller.isCardSet[i]
//                                   ? controller.cardOffsets[i].dy
//                                   : 100.px,
//                               child: GestureDetector(
//                                 onTap: () => !controller.isCardSet[i]
//                                     ? controller.onCardTap(index: i)
//                                     : null,
//                                 child: Transform.scale(
//                                   scale: 0.9,
//                                   child: Cw.commonNetworkImageView(
//                                     path: controller.isCardSet[i]
//                                         ? 'assets/cards_img/c_bg_img.png'
//                                         : controller.cardList[i],
//                                     height: 80,
//                                     width: 60,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),