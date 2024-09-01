import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../player_wins_all_ties/controllers/player_wins_all_ties_controller.dart';

class CardScreenController extends GetxController {
  final count = 0.obs;

  List<bool> isCardSet = [false, false, false]; // Tracks if each card is set
  List<Offset> cardOffsets = [Offset(5.px, 5.px), Offset(10.px, 10.px),Offset(15.px, 15.px)]; // Predefined offsets for stacking

  final topCardValue = false.obs;

  final isLastCardSelectValue = true.obs;

  final doubleDownButtonValue = false.obs;

  List topCardList = [
    'assets/cards_img/cA_img.png',
    'assets/cards_img/c2_img.png',
    'assets/cards_img/c3_img.png',
    'assets/cards_img/c10.png',
    'assets/cards_img/cQ.png',
  ];

  List cardList = [
    'assets/cards_img/c9.png',
    'assets/cards_img/c4.png',
    'assets/cards_img/c6.png',
  ];



  final isHighCardSelected = ''.obs;

  Random random = Random();

  List<Map<String, dynamic>> listOfCardsAndValues = [
    {'card': 'A', 'lowValue': '1','highValue':'11'},
    {'card': '2', 'lowValue': '2','highValue':'2'},
    {'card': '3', 'lowValue': '3','highValue':'3'},
    {'card': '4', 'lowValue': '4','highValue':'4'},
    {'card': '5', 'lowValue': '5','highValue':'5'},
    {'card': '6', 'lowValue': '6','highValue':'6'},
    {'card': '7', 'lowValue': '7','highValue':'7'},
    {'card': '8', 'lowValue': '8','highValue':'8'},
    {'card': '9', 'lowValue': '9','highValue':'9'},
    {'card': '10', 'lowValue': '10','highValue':'10'},
    {'card': 'J', 'lowValue': '0','highValue':'0'},
    {'card': 'Q', 'lowValue': '0','highValue':'0'},
    {'card': 'K', 'lowValue': '0','highValue':'0'},
  ];

  List<Map<String, dynamic>> firstList = [];
  List<Map<String, dynamic>> secondList = [];

  final dealerValue = 0.obs;
  final userValue = 0.obs;

  final userWinOrNotValue = false.obs;

  @override
  void onInit() {
    super.onInit();
    getRandomCardValues();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getRandomCardValues(){
    // int randomIndex = random.nextInt(listOfCardsAndValues.length);
    //
    // Map<String, dynamic> randomMap = listOfCardsAndValues[randomIndex];
    // String cardValue = randomMap["card"]!;
    // String loValue = randomMap["lowValue"]!;
    // String hiValue = randomMap["highValue"]!;
    //
    // // Print the randomly selected map's values
    // print("Randomly selected card: $cardValue");
    // print("Lo value: $loValue");
    // print("Hi value: $hiValue");



    Random random = Random();
    List<Map<String, dynamic>> tempList = List.from(listOfCardsAndValues);

    // Select 5 random unique items for the first list
    for (int i = 0; i < 5; i++) {
      int randomIndex = random.nextInt(tempList.length);
      firstList.add(tempList[randomIndex]);
      tempList.removeAt(randomIndex);
    }

    // Select 3 random unique items for the second list
    for (int i = 0; i < 3; i++) {
      int randomIndex = random.nextInt(tempList.length);
      secondList.add(tempList[randomIndex]);
      tempList.removeAt(randomIndex);
    }

    print('First List: $firstList');
    print('Second List: $secondList');


  }

  void onCardTap({required int index})  {
    for (int i = 0; i < isCardSet.length; i++) {
      isCardSet[i] = true;
    }
    count.value++;
  }

  void clickOnHighCard({required String text}) {
    if(isHighCardSelected.value == '') {
      isHighCardSelected.value = text;
      onCardTap(index: 0);
    }
    isLastCardSelectValue.value = false;
    count.value++;
  }

  void clickOnLowCard({required String text}) {
    if(isHighCardSelected.value == '') {
      isHighCardSelected.value = text;
      onCardTap(index: 0);
    }
    isLastCardSelectValue.value = false;
    count.value++;
  }

  void showDialogView() {
    showDialog<String>(
      context: Get.context!,
      barrierDismissible: false,
      barrierColor: LightThemeColor().blackColor.withOpacity(.4),
      builder: (BuildContext context) => Dialog(
        backgroundColor: LightThemeColor().whiteColor,
        insetPadding: EdgeInsets.all(20.px),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: LightThemeColor().secondaryColor,
              width: 2.px,
            ),
            borderRadius: BorderRadius.circular(22.px),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 30.px),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Place holder text that says stuff like you won !! an includes Pay tables and win details.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 20.px),
                SizedBox(
                  height: 84.px,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cardData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 84.px,
                          width: 84.px,
                          margin: EdgeInsets.only(right: index != 2 ? 16.px : 0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: LightThemeColor().onPrimary,
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
                                  cardTitleData[index] ?? '',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: LightThemeColor().secondaryColor,
                                    letterSpacing: 0,
                                    height: -1,
                                  ),
                                ).paddingOnly(top: 20.px, bottom: 2.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Cw.commonNetworkImageView(
                                        path: ImagePathConst.coinImg,
                                        height: 16.px,
                                        width: 16.px
                                    ),
                                    SizedBox(width: 5.px),
                                    Text(
                                      userWinOrNotValue.value
                                          ? '+ ${cardData[index]}'
                                          : '- ${cardData[index]}',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        color: userWinOrNotValue.value
                                            ? LightThemeColor().success
                                            : LightThemeColor().error
                                      ),
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
                ),
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Cw.commonElevatedButton(
                      onPressed: () =>  Get.offAllNamed(Routes.HOME),
                      buttonText: 'Home',
                      fontSize: 16.px,
                      height: 50.px,
                      width: 132.px
                    ),
                    SizedBox(width: 10.px),
                    Cw.commonElevatedButton(
                      onPressed: () {
                        // Cm.showToast('Work in progress!');
                        Get.back();
                      },
                      buttonText: 'Play again',
                      fontSize: 16.px,
                      height: 50.px,
                      width: 132.px
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).whenComplete(() => Get.back(),);
  }

  void clickOnPlayButton() {
    String localSelectedCardValue = isHighCardSelected.value;

    if(isHighCardSelected.value != ''){
      firstList.sort((a, b) {
        return int.parse(a['lowValue']).compareTo(int.parse(b['lowValue']));
      },);
      secondList.sort((a, b) {
        return int.parse(a['lowValue']).compareTo(int.parse(b['lowValue']));
      },);

      if(localSelectedCardValue == 'Low'){
        for (int i = 0; i <= 2; i++){
          dealerValue.value = int.parse(firstList[i]['lowValue']) + dealerValue.value;
          print('i:::: $i');
        }
      }
      else{
        for (int i = 2; i <= 4; i++){
          dealerValue.value = int.parse(firstList[i]['highValue'])+dealerValue.value;
        }
      }

      print('dealerValue.value:::::: ${dealerValue.value}');


      if(localSelectedCardValue == 'Low'){
        for (int i = 0; i <= 2; i++){
          userValue.value = int.parse(secondList[i]['lowValue'])+userValue.value;
        }
      }
      else{
        for (int i = 0; i <= 2; i++){
          userValue.value = int.parse(secondList[i]['highValue'])+userValue.value;
        }
      }

      print('userValue.value:::::::: ${userValue.value}');

      if(dealerValue.value <= userValue.value){
        userWinOrNotValue.value = true;
        print('true');
      }else{
        userWinOrNotValue.value = false;
        print('false');
      }

      isHighCardSelected.value = '';
      isLastCardSelectValue.value = true;
      topCardValue.value = true;
      for (int i = 0; i < isCardSet.length; i++) {
        isCardSet[i] = false;
      }
      Future.delayed(const Duration(seconds: 1),() => showDialogView(),);
      // Get.toNamed(Routes.STORE);
      count.value++;
    }else{
      Cm.showToast('Please select card.');
    }
  }

  void clickOnDoubleDownButton() {
    if(doubleDownButtonValue.value == false) {
      doubleDownButtonValue.value = true;
    }else{
      Cm.showToast('Coming soon!');
    }
   count.value++;
  }

}
