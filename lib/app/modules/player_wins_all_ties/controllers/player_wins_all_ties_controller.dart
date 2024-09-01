import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final walletCoinValue = 1000.obs;

final totalCoinValue = 0.obs;

List<int> cardData = [
  5,
  25,
  0
];

List cardTitleData = [
  'Bonus\nMatch',
  'Main Bet',
  'Poker\nBonus',
];



class PlayerWinsAllTiesController extends GetxController {

  final count = 0.obs;

  List cardImgList = [
    ImagePathConst.vYellowImg,
    ImagePathConst.vRedImg,
    ImagePathConst.vGreenImg,
    ImagePathConst.vBlackImg,
  ];

  List<int> cardCoinValueList = [
    1,
    5,
    25,
    100,
  ];


    @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      walletCoinValue.value = 1000;
      cardData = [5, 25, 0];
      totalCoinValue.value = cardData.fold(0, (sum, item) => sum + item);
      if (walletCoinValue.value >= totalCoinValue.value) {
        walletCoinValue.value = walletCoinValue.value - totalCoinValue.value;
      }
    });
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

  // void addCoinValue({required int index, required int data}) {
  //   cardData[index] += data;
  //   totalCoinValue.value += data;
  //   if (walletCoinValue.value >= totalCoinValue.value) {
  //     walletCoinValue.value -= data;
  //   }
  //
  //   count.value++;
  // }

  void addCoinValue({required int index, required int data}) {
    int potentialNewTotal = totalCoinValue.value + data;

    if (walletCoinValue.value >= data) {
      cardData[index] += data;

      totalCoinValue.value = potentialNewTotal;

      walletCoinValue.value -= data;

      count.value++;
    } else {
      Get.snackbar(
        'Insufficient Coins',
        'You do not have enough coins to add this value.',
        backgroundColor: LightThemeColor().secondaryColor,
        margin: EdgeInsets.all(16.px),
        duration: const Duration(seconds: 1)
      );
    }
  }

  clickOnHomeButton() {
  totalCoinValue.value = 1000;
   Get.back();
  }

  Future<void> clickOnDealButton() async {
    Get.toNamed(Routes.CARD_SCREEN);
  }




}
