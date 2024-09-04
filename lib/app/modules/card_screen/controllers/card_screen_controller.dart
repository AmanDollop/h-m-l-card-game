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

    /// Todo Spade Cards
    {'card': 'spadesA', 'lowValue': '1','highValue':'11'},
    {'card': 'spades2', 'lowValue': '2','highValue':'2'},
    {'card': 'spades3', 'lowValue': '3','highValue':'3'},
    {'card': 'spades4', 'lowValue': '4','highValue':'4'},
    {'card': 'spades5', 'lowValue': '5','highValue':'5'},
    {'card': 'spades6', 'lowValue': '6','highValue':'6'},
    {'card': 'spades7', 'lowValue': '7','highValue':'7'},
    {'card': 'spades8', 'lowValue': '8','highValue':'8'},
    {'card': 'spades9', 'lowValue': '9','highValue':'9'},
    {'card': 'spades10', 'lowValue': '10','highValue':'10'},
    {'card': 'spadesJ', 'lowValue': '0','highValue':'0'},
    {'card': 'spadesQ', 'lowValue': '0','highValue':'0'},
    {'card': 'spadesK', 'lowValue': '0','highValue':'0'},

    /// Todo Clubs Cards
    {'card': 'clubsA', 'lowValue': '1','highValue':'11'},
    {'card': 'clubs2', 'lowValue': '2','highValue':'2'},
    {'card': 'clubs3', 'lowValue': '3','highValue':'3'},
    {'card': 'clubs4', 'lowValue': '4','highValue':'4'},
    {'card': 'clubs5', 'lowValue': '5','highValue':'5'},
    {'card': 'clubs6', 'lowValue': '6','highValue':'6'},
    {'card': 'clubs7', 'lowValue': '7','highValue':'7'},
    {'card': 'clubs8', 'lowValue': '8','highValue':'8'},
    {'card': 'clubs9', 'lowValue': '9','highValue':'9'},
    {'card': 'clubs10', 'lowValue': '10','highValue':'10'},
    {'card': 'clubsJ', 'lowValue': '0','highValue':'0'},
    {'card': 'clubsQ', 'lowValue': '0','highValue':'0'},
    {'card': 'clubsK', 'lowValue': '0','highValue':'0'},

    /// Todo Diamonds Cards
    {'card': 'diamondsA', 'lowValue': '1','highValue':'11'},
    {'card': 'diamonds2', 'lowValue': '2','highValue':'2'},
    {'card': 'diamonds3', 'lowValue': '3','highValue':'3'},
    {'card': 'diamonds4', 'lowValue': '4','highValue':'4'},
    {'card': 'diamonds5', 'lowValue': '5','highValue':'5'},
    {'card': 'diamonds6', 'lowValue': '6','highValue':'6'},
    {'card': 'diamonds7', 'lowValue': '7','highValue':'7'},
    {'card': 'diamonds8', 'lowValue': '8','highValue':'8'},
    {'card': 'diamonds9', 'lowValue': '9','highValue':'9'},
    {'card': 'diamonds10', 'lowValue': '10','highValue':'10'},
    {'card': 'diamondsJ', 'lowValue': '0','highValue':'0'},
    {'card': 'diamondsQ', 'lowValue': '0','highValue':'0'},
    {'card': 'diamondsK', 'lowValue': '0','highValue':'0'},

    /// Todo Hearts Cards
    {'card': 'heartsA', 'lowValue': '1','highValue':'11'},
    {'card': 'hearts2', 'lowValue': '2','highValue':'2'},
    {'card': 'hearts3', 'lowValue': '3','highValue':'3'},
    {'card': 'hearts4', 'lowValue': '4','highValue':'4'},
    {'card': 'hearts5', 'lowValue': '5','highValue':'5'},
    {'card': 'hearts6', 'lowValue': '6','highValue':'6'},
    {'card': 'hearts7', 'lowValue': '7','highValue':'7'},
    {'card': 'hearts8', 'lowValue': '8','highValue':'8'},
    {'card': 'hearts9', 'lowValue': '9','highValue':'9'},
    {'card': 'hearts10', 'lowValue': '10','highValue':'10'},
    {'card': 'heartsJ', 'lowValue': '0','highValue':'0'},
    {'card': 'heartsQ', 'lowValue': '0','highValue':'0'},
    {'card': 'heartsK', 'lowValue': '0','highValue':'0'},


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
