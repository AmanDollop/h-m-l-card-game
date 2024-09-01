import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/common/cw/cw.dart';
import 'package:hi_matchem_lo_card_game/app/routes/app_pages.dart';
import 'package:hi_matchem_lo_card_game/app/theme/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Cm {
  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Widget videoView(
      {required String url,
      required YoutubePlayerController youtubePlayerController}) {
    final videoId = YoutubePlayer.convertUrlToId(url) ?? '';
    return Container(
      padding: EdgeInsets.all(10.px),
      decoration: BoxDecoration(
          color: LightThemeColor().blackColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(20.px),
          border:Border.all(color: LightThemeColor().secondaryColor, width: 2.px)),
      child: FutureBuilder<bool>(
        future: checkVideoUrl(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ytLogoView(
                widget: Cw.commonShimmerViewForImage(
              context: context,
              height: 190.px,
              radius: 10,
            )); // Show loading indicator while checking
          } else if (snapshot.hasError || !snapshot.data!) {
            return const Text('Video not available');
          } else {
            return InkWell(
              onTap: () {
                youtubePlayerController = YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                );
                Get.toNamed(Routes.LEARN_VIDEO,
                    arguments: [youtubePlayerController]);
              },
              child: Center(
                child: ytLogoView(
                    widget: Cw.commonNetworkImageView(
                        path:
                            'https://img.youtube.com/vi/$videoId/mqdefault.jpg',
                        height: 190.px,
                        width: double.infinity,
                        radius: 10.px,
                        fit: BoxFit.fill,
                        isAssetImage: false)),
              ),
            );
          }
        },
      ),
    );
  }

  static Future<bool> checkVideoUrl(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      print('response.statusCode:::: ${response.statusCode}');
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 404) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      print('object');
      return false; // Handle any other errors, such as network issues
    }
  }

  static Widget ytLogoView({required Widget widget}) => Stack(
        alignment: Alignment.center,
        children: [
          widget,
          Cw.commonNetworkImageView(
              path: ImagePathConst.ytImg,
              width: 74.px,
              height: 50.px,
              radius: 10.px,
              fit: BoxFit.contain),
        ],
      );

  static void showToast(
      String msg, {
        ToastGravity? gravity,
        Color? color
      }) {
    Fluttertoast.showToast(
        msg: msg,
        textColor: LightThemeColor().text,
        fontSize: 16.px,

        gravity: gravity ?? ToastGravity.TOP,
        backgroundColor: color ?? LightThemeColor().secondaryColor
    );
  }
}
