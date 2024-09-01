import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';

class SignUpController extends GetxController {

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

  void clickOnSignUpButton() {
    Get.toNamed(Routes.USER_AGREEMENT);
  }

}
