
import 'dart:async';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';

class SplashController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () => Get.offNamed(Routes.SIGN_IN),);
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
}
