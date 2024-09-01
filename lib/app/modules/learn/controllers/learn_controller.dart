import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearnController extends GetxController {

  final count = 0.obs;

  late YoutubePlayerController youtubePlayerController;

  final currentPageIndexValue = 0.obs;
  PageController pageController = PageController();

  final dialogCurrentPageIndexValue = 0.obs;
  PageController dialogPageController = PageController();

  List<List<Map<String,String>>> cardDataList = [
    [
      {
        'title': 'The Goal','detail': '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'''
      },
      {
        'title': 'The Game','detail': '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'''
      },
    ],
    [
      {
        'title': 'The Bets','detail': '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'''
      },
      {
        'title': 'The Strategy','detail': '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'''
      },
    ],
    [
      {
        'title': 'The Pay Tables 1','detail': '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'''
      },
      {
        'title': 'The Pay Tables 2','detail': '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.'''
      },
    ],
  ];

  List dialogData = [
    'To get started place your bets by dragging chips to the three options then click Deal when  you’re ready to go!',
    'Decide if your three cards will be lower than the Dealer’s lo hand or Higher than their Hi hand. Double Down if you’d like. Remember Face cards are 0 and A are 1 for Lo hands and 11 for Hi.',
    'Tap the Hi or Lo stack to make your choice. You win all ties!',
    'Click Continue to see how you’ve done.',
    'The Dealers are compared against yours to see how you’ve done. No coins are gained or lost when learning.',
  ];

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
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

  void clickOnFullRulesButton() {
    pageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  void clickOnNextButton() {
    if(currentPageIndexValue.value != cardDataList.length-1) {
      pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }else{
      showDialogView();
    }
  }

  void showDialogView() {
    dialogCurrentPageIndexValue.value = 0;
    // dialogPageController.jumpTo(0);
    showDialog<String>(
      context: Get.context!,
      barrierDismissible: false,
      barrierColor: LightThemeColor().blackColor.withOpacity(.4),
      builder: (BuildContext context) => Dialog(
        backgroundColor: LightThemeColor().whiteColor,
        insetPadding: EdgeInsets.all(20.px),
        child: Obx(
            (){
              count.value;
              return Container(
                height: 250.px,
                padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LightThemeColor().secondaryColor,
                    width: 2.px,
                  ),
                  borderRadius: BorderRadius.circular(24.px),
                ),
                child: PageView.builder(
                  controller: dialogPageController,
                  itemCount: dialogData.length,
                  onPageChanged: (value) {
                    dialogCurrentPageIndexValue.value = value;
                    count.value++;
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          dialogData[index],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 10.px),
                        Cw.commonElevatedButton(
                            onPressed: () => clickOnDialogNextButton(),
                            buttonText: /*dialogCurrentPageIndexValue.value != dialogData.length-1
                                ? 'Next'
                                : 'Back to Home'*/'Next',
                            fontSize: 16.px,
                            height: 52.px,
                            width: 162.px
                        ),
                      ],
                    );
                  },
                ),
              );
            }
        ),
      ),
    );
  }

  void clickOnDialogNextButton() {
    if(dialogCurrentPageIndexValue.value != dialogData.length-1) {
      dialogPageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }else{
      Get.back();
      Cm.showToast('Work in progress!');
      // Get.back();
    }
  }

}
