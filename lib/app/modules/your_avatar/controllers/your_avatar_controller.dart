import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';

class YourAvatarController extends GetxController {

  final count = 0.obs;

  final selectAvatar = 'assets/avatar_img/a1.png'.obs;

  List cardImgList = [
    'assets/avatar_img/a1.png',
    'assets/avatar_img/a2.png',
    'assets/avatar_img/a3.png',
    'assets/avatar_img/a4.png',
    'assets/avatar_img/a5.png',
    'assets/avatar_img/a6.png',
    'assets/avatar_img/a7.png',
    'assets/avatar_img/a8.png',
    'assets/avatar_img/a9.png',
    'assets/avatar_img/a10.png',
    'assets/avatar_img/a11.png',
    'assets/avatar_img/a12.png',
    'assets/avatar_img/a13.png',
    'assets/avatar_img/a14.png',
    'assets/avatar_img/a15.png',
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

  void clickOnAvatarView({required int index}) {
    if(index != cardImgList.length-1){
      if(selectAvatar.value.contains(cardImgList[index])){
        selectAvatar.value = 'assets/avatar_img/a1.png';
      }else{
        selectAvatar.value = cardImgList[index];
      }
    }
    count.value++;
  }

  void clickOnContinueButton() {
    Get.toNamed(Routes.HOME);
  }
}
