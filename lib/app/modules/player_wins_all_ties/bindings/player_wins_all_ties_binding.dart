import 'package:get/get.dart';

import '../controllers/player_wins_all_ties_controller.dart';

class PlayerWinsAllTiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerWinsAllTiesController>(
      () => PlayerWinsAllTiesController(),
    );
  }
}
