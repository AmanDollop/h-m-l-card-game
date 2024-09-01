import 'package:get/get.dart';

import '../controllers/user_agreement_controller.dart';

class UserAgreementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAgreementController>(
      () => UserAgreementController(),
    );
  }
}
