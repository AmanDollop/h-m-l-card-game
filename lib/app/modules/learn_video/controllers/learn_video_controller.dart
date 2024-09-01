import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearnVideoController extends GetxController {

  final count = 0.obs;

  late YoutubePlayerController controller;

  @override
  void onInit() {
    super.onInit();
    controller = Get.arguments[0];
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

  onWillPop() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
      controller.dispose();
      Get.back();
    });
  }

}
