import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/learn_video_controller.dart';

class LearnVideoView extends GetView<LearnVideoController> {
  const LearnVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) => controller.onWillPop(),
      child: Scaffold(
        body: Cw.commonBgView(
          widget: Stack(
            children: [
              Center(
                child: YoutubePlayer(
                  controller: controller.controller,
                  showVideoProgressIndicator: true,
                ),
              ),
              SafeArea(
                child: backButtonView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget backButtonView() => Padding(
    padding: EdgeInsets.all(16.px),
    child: InkWell(
          onTap: () => controller.onWillPop,
          borderRadius: BorderRadius.circular(10.px),
          child: Container(
            height: 40.px,
            width: 40.px,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePathConst.ySquareButtonBgImg),
                fit: BoxFit.contain,
              ),
            ),
            child: Center(
              child: Cw.commonNetworkImageView(
                path: IconConst.backIc,
                width: 18.px,
                height: 18.px,
              ),
            ),
          ),
        ),
  );
}
