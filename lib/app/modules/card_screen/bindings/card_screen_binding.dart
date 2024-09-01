import 'package:get/get.dart';

import '../controllers/card_screen_controller.dart';

class CardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardScreenController>(
      () => CardScreenController(),
    );
  }
}
