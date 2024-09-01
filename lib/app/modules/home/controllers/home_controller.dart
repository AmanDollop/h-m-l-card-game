import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/modules/home/views/home_view.dart';
import 'package:hi_matchem_lo_card_game/app/modules/player_wins_all_ties/controllers/player_wins_all_ties_controller.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final addBannerShowValue = false.obs;

  List cardImgList =[
    ImagePathConst.frame1Img,
    ImagePathConst.frameImg,
    ImagePathConst.isolationModeImg,
    ImagePathConst.storeImg,
  ];

  @override
  void onInit() {
    super.onInit();
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

  Future<void> clickOnPlayButton() async {
    await Get.toNamed(Routes.PLAYER_WINS_ALL_TIES);
    walletCoinValue.value = 1000;
  }

  void clickOnLearnButton() {
    Cm.showToast('Coming soon!');
    // Get.toNamed(Routes.LEARN);
  }

  void clickOnFindLiveGameButton() {
    Cm.showToast('Coming soon!');
    ///Todo for version 2
    // showDialogView();
  }

  void showDialogView(){
    showDialog<String>(
      context: Get.context!,
      barrierDismissible: false,
      barrierColor: LightThemeColor().blackColor.withOpacity(.4),
      builder: (BuildContext context) => Dialog(
        backgroundColor: LightThemeColor().onPrimary,
        insetPadding: EdgeInsets.all(40.px),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
               color: LightThemeColor().secondaryColor,
               width: 2.px
              ),
              borderRadius: BorderRadius.circular(22.px)
          ),
          child: Padding(
            padding: EdgeInsets.all(30.px),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeView().titleTextView(text: 'Allow Notifications'),
                    SizedBox(height: 6.px),
                    Row(
                      children: [
                        const HomeView().titleTextView(text: 'for +X '),
                        Cw.commonNetworkImageView(
                          path: ImagePathConst.coinImg,
                          height: 24.px,
                          width: 24.px,
                        ),
                        const HomeView().titleTextView(text: ' ?'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50.px),
                Cw.commonElevatedButton(
                  height: 62.px,
                  onPressed: () {
                    addBannerShowValue.value = true;
                    count.value++;
                    Get.back();
                  },
                  buttonText: 'Yes',
                ),
                SizedBox(height: 10.px),
                Cw.commonElevatedButton(
                    height: 62.px,
                    onPressed: () => Get.back(),
                    buttonText: 'No',
                    isRedBgImg: true
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
