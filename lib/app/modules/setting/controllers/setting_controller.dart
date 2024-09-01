import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SettingController extends GetxController {

  final count = 0.obs;

  final soundEffectValue = false.obs;
  final notificationValue = false.obs;

  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
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
