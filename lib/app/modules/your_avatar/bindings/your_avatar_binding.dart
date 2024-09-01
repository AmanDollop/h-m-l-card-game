import 'package:get/get.dart';

import '../controllers/your_avatar_controller.dart';

class YourAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourAvatarController>(
      () => YourAvatarController(),
    );
  }
}
