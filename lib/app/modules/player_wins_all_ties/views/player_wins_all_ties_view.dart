import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/player_wins_all_ties_controller.dart';

class PlayerWinsAllTiesView extends GetView<PlayerWinsAllTiesController> {
  const PlayerWinsAllTiesView({super.key});

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
                  SizedBox(height: 18.px),
                  Cw.appLogoView(w: 190.px),
                  // const Center(
                  //   child: XPProgressBar(
                  //     progress: 0.5, // 50% progress
                  //     currentXP: 500,
                  //     totalXP: 1000,
                  //   ),
                  // ),
                  SizedBox(height: 18.px),
                  coinsCardsView(),
                  SizedBox(height: 10.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      homeButtonView(),
                      SizedBox(width: 10.px),
                      dealButtonView()
                    ],
                  ),
                  SizedBox(height: 20.px),
                  Center(
                    child: Text(
                      'Player Wins All Ties',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LightThemeColor().secondaryColor,
                        letterSpacing: 0,
                        fontSize: 20.px,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.px),
                  /*
                  Cw.commonNetworkImageView(
                      path: ImagePathConst.addBannerImg,
                      height: 80.px,
                      width: double.infinity
                  ),

                  SizedBox(height: 16.px),*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleTextView({required String text, int? maxLines, double? fontSize, Color? color}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
      color: color ?? LightThemeColor().whiteColor,
      fontSize: fontSize ?? 24.px,
    ),
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

  Widget cardView() => commonContainerView(
        widget: Column(
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
                Cw.commonNetworkImageView(path: ImagePathConst.coinImg, height: 16.px, width: 16.px),
                titleTextView(text: ' ${walletCoinValue.value}', fontSize: 18.px),
                SizedBox(width: 10.px),
                settingButtonView(),
              ],
            ),

            ///Todo for version 2
            /*SizedBox(height: 14.px),
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
        ),*/
          ],
        ),
      );

  Widget profileView() => Container(
    height: 50.px,
    width: 50.px,
    margin: EdgeInsets.only(right: 20.px),
    decoration: BoxDecoration(
          color: LightThemeColor().whiteColor,
          shape: BoxShape.circle,
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
            child: titleTextView(text: title, maxLines: 1, fontSize: 22.px),
          ),
        ],
      );

  Widget homeButtonView() => Cw.commonElevatedButton(
      onPressed: () => controller.clickOnHomeButton(),
      buttonText: 'Home',
      fontSize: 20.px,
      height: 60.px,
      width: 156.px,
  );

  Widget dealButtonView() => Cw.commonElevatedButton(
      onPressed: () => controller.clickOnDealButton(),
      buttonText: 'Deal',
      fontSize: 20.px,
      height: 60.px,
      width: 156.px,
  );

  // Widget coinsCardsView() => commonContainerView(
  //     widget: Column(
  //       children: [
  //         SizedBox(
  //           height: 70.px,
  //           child: Center(
  //             child: ListView.builder(
  //               // physics: const NeverScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               itemCount: controller.cardImgList.length,
  //               scrollDirection: Axis.horizontal,
  //               // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 10.px),
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   height: 70.px,
  //                   width: 70.px,
  //                   margin: EdgeInsets.only(right: index != 3?10.px:0),
  //                   decoration: BoxDecoration(
  //                     // color: Colors.red,
  //                       image: DecorationImage(
  //                           image: AssetImage(controller.cardImgList[index]),
  //                           fit: BoxFit.contain
  //                       )
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       controller.cardCoinValueList[index],
  //                       style: Theme.of(context).textTheme.bodySmall,
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 90.px,
  //           child: Center(
  //             child: ListView.builder(
  //               // physics: const NeverScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               itemCount: controller.cardData.length,
  //               scrollDirection: Axis.horizontal,
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   height: 90.px,
  //                   width: 90.px,
  //                   margin: EdgeInsets.only(right: index != 2 ? 20.px : 0),
  //                   alignment: Alignment.center,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color: LightThemeColor().blackColor.withOpacity(.3),
  //                       border: Border.all(
  //                           color: LightThemeColor().secondaryColor,
  //                           width: 3.px
  //                       )
  //                   ),
  //                   child: Center(
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           controller.cardData[index]['title'] ?? '',
  //                           style: Theme.of(context).textTheme.titleLarge?.copyWith(
  //                            color: LightThemeColor().secondaryColor,
  //                            letterSpacing: 0,
  //                            height: -1
  //                           ),
  //                         ).paddingOnly(top: 30.px,bottom: 2.px),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Cw.commonNetworkImageView(
  //                              path: ImagePathConst.coinImg,
  //                              height: 16.px,
  //                              width: 16.px
  //                             ),
  //                             SizedBox(width: 5.px),
  //                             Text(
  //                               controller.cardData[index]['coinValue'].toString(),
  //                               style: Theme.of(context).textTheme.titleLarge,
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 14.px),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             titleTextView(text: '   Clear Bet',color: LightThemeColor().error),
  //             Row(
  //               children: [
  //                 titleTextView(text: 'Total Bet  '),
  //                 Cw.commonNetworkImageView(
  //                     path: ImagePathConst.coinImg,
  //                     height: 24.px,
  //                     width: 24.px
  //                 ),
  //                 titleTextView(text: '  30'),
  //               ],
  //             )
  //           ],
  //         ),
  //         SizedBox(height: 10.px),
  //       ],
  //     )
  // );

  // Widget coinsCardsView() => commonContainerView(
  //       widget: Column(
  //         children: [
  //           SizedBox(
  //             height: 70.px,
  //             child: Center(
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: controller.cardImgList.length,
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: (context, index) {
  //                   return Draggable<int>(
  //                     data: controller.cardCoinValueList[index],
  //                     feedback: Container(
  //                       height: 70.px,
  //                       width: 70.px,
  //                       decoration: BoxDecoration(
  //                         image: DecorationImage(
  //                           image: AssetImage(controller.cardImgList[index]),
  //                           fit: BoxFit.contain,
  //                         ),
  //                       ),
  //                     ),
  //                     childWhenDragging: Container(
  //                       height: 70.px,
  //                       width: 70.px,
  //                       margin: EdgeInsets.only(right: index != 3 ? 10.px : 0),
  //                     ),
  //                     child: Container(
  //                       height: 70.px,
  //                       width: 70.px,
  //                       margin: EdgeInsets.only(right: index != 3 ? 10.px : 0),
  //                       decoration: BoxDecoration(
  //                         image: DecorationImage(
  //                           image: AssetImage(controller.cardImgList[index]),
  //                           fit: BoxFit.contain,
  //                         ),
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           controller.cardCoinValueList[index].toString(),
  //                           style: Theme.of(context).textTheme.bodySmall,
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 90.px,
  //             child: Center(
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: cardTitleData.length,
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: (context, index) {
  //                   return DragTarget<int>(
  //                     onAccept: (data) {
  //                       controller.addCoinValue(index: index, data: data);
  //                     },
  //                     builder: (context, candidateData, rejectedData) {
  //                       return Container(
  //                         height: 90.px,
  //                         width: 90.px,
  //                         margin: EdgeInsets.only(right: index != 2 ? 20.px : 0),
  //                         decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           color: LightThemeColor().blackColor.withOpacity(.3),
  //                           border: Border.all(
  //                             color: LightThemeColor().secondaryColor,
  //                             width: 3.px,
  //                           ),
  //                         ),
  //                         child: Center(
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Text(
  //                                 cardTitleData[index],
  //                                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  //                                   color: LightThemeColor().secondaryColor,
  //                                   letterSpacing: 0,
  //                                   height: 1.2,
  //                                 ),
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                               SizedBox(height: 5.px),
  //                               Row(
  //                                 mainAxisAlignment: MainAxisAlignment.center,
  //                                 children: [
  //                                   Cw.commonNetworkImageView(
  //                                     path: ImagePathConst.coinImg,
  //                                     height: 16.px,
  //                                     width: 16.px,
  //                                   ),
  //                                   SizedBox(width: 5.px),
  //                                   Text(
  //                                     cardData[index].toString(),
  //                                     style: Theme.of(context).textTheme.titleLarge,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 14.px),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Obx((){
  //                 controller.count.value;
  //                 return GestureDetector(
  //                   onTap: () {
  //                     controller.onInit();
  //                     controller.count.value++;
  //                   },
  //                   child: titleTextView(
  //                     text: '   Clear Bet',
  //                     color: LightThemeColor().error,
  //                   ),
  //                 );
  //               }),
  //               Row(
  //                 children: [
  //                   titleTextView(
  //                     text: 'Total Bet  ',
  //                     fontSize: 16.px,
  //                   ),
  //                   Cw.commonNetworkImageView(
  //                     path: ImagePathConst.coinImg,
  //                     height: 24.px,
  //                     width: 24.px,
  //                   ),
  //                   titleTextView(
  //                     text: '  ${totalCoinValue.value}',
  //                     fontSize: 14.px,
  //                   ).paddingOnly(right: 16.px),
  //                 ],
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     );

  Widget coinsCardsView() => commonContainerView(
    widget: Column(
      children: [
        topCoinCardListView(),
        bottomCoinCardListView(),
        SizedBox(height: 14.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              controller.count.value;
              return clearBetView();
            }),
            totalBetCoinView(),
          ],
        )
      ],
    ),
  );

  Widget topCoinCardListView() => SizedBox(
    height: 70.px,
    child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.cardImgList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Draggable<int>(
            data: controller.cardCoinValueList[index],
            feedback: Container(
              height: 70.px,
              width: 70.px,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.cardImgList[index]),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                child: Text(
                  controller.cardCoinValueList[index].toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 16.px,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            childWhenDragging: Container(
              height: 70.px,
              width: 70.px,
              margin: EdgeInsets.only(right: index != 3 ? 10.px : 0),
            ),
            child: Container(
              height: 70.px,
              width: 70.px,
              margin: EdgeInsets.only(right: index != 3 ? 10.px : 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.cardImgList[index]),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                child: Text(
                  controller.cardCoinValueList[index].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );

  Widget bottomCoinCardListView() => SizedBox(
    height: 90.px,
    child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cardTitleData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DragTarget<int>(
            onAccept: (data) {
              controller.addCoinValue(index: index, data: data);
            },
            builder: (context, candidateData, rejectedData) {
              bool isHighlighted = candidateData.isNotEmpty;

              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isHighlighted ? 100.px : 90.px,
                width: isHighlighted ? 100.px : 90.px,
                margin: EdgeInsets.only(right: index != 2 ? 20.px : 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isHighlighted
                      ? LightThemeColor().secondaryColor.withOpacity(0.5)
                      : LightThemeColor().blackColor.withOpacity(.3),
                  border: Border.all(
                    color: LightThemeColor().secondaryColor,
                    width: 3.px,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cardTitleData[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: LightThemeColor().secondaryColor,
                          letterSpacing: 0,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5.px),
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
          );
        },
      ),
    ),
  );

  Widget clearBetView() => GestureDetector(
    onTap: () {
      controller.onInit();
      controller.count.value++;
    },
    child: titleTextView(
      text: '   Clear Bet',
      color: LightThemeColor().error,
    ),
  );

  Widget totalBetCoinView() => Row(
    children: [
      titleTextView(
        text: 'Total Bet  ',
        fontSize: 16.px,
      ),
      Cw.commonNetworkImageView(
        path: ImagePathConst.coinImg,
        height: 24.px,
        width: 24.px,
      ),
      titleTextView(
        text: '  ${totalCoinValue.value}',
        fontSize: 14.px,
      ).paddingOnly(right: 16.px),
    ],
  );

}



class XPProgressBar extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0
  final int currentXP;
  final int totalXP;

  const XPProgressBar({super.key,
    required this.progress,
    required this.currentXP,
    required this.totalXP,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40, // Height of the progress bar
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            gradient: LinearGradient(
              colors: [Colors.blue.shade800, Colors.blue.shade600],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade900,
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade600, Colors.orange.shade400],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$currentXP/$totalXP XP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Cw.commonNetworkImageView(
          path: 'assets/img/loading_img.png',
          height: 40.px,
          width: double.infinity,
          fit: BoxFit.cover
        )
      ],
    );
  }
}
