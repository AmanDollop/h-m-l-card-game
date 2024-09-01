import 'package:get/get.dart';

import '../controllers/learn_video_controller.dart';

class LearnVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnVideoController>(
      () => LearnVideoController(),
    );
  }
}
