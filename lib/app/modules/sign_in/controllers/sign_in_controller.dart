import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';

class SignInController extends GetxController {

  final count = 0.obs;

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

  void clickOnEmailButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  void clickOnPlayAsGuestButton() {
    Get.toNamed(Routes.USER_AGREEMENT);
  }

}
