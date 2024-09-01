import 'package:get/get.dart';

import '../modules/card_screen/bindings/card_screen_binding.dart';
import '../modules/card_screen/views/card_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/learn/bindings/learn_binding.dart';
import '../modules/learn/views/learn_view.dart';
import '../modules/learn_video/bindings/learn_video_binding.dart';
import '../modules/learn_video/views/learn_video_view.dart';
import '../modules/play/bindings/play_binding.dart';
import '../modules/play/views/play_view.dart';
import '../modules/player_wins_all_ties/bindings/player_wins_all_ties_binding.dart';
import '../modules/player_wins_all_ties/views/player_wins_all_ties_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/store/bindings/store_binding.dart';
import '../modules/store/views/store_view.dart';
import '../modules/user_agreement/bindings/user_agreement_binding.dart';
import '../modules/user_agreement/views/user_agreement_view.dart';
import '../modules/your_avatar/bindings/your_avatar_binding.dart';
import '../modules/your_avatar/views/your_avatar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.USER_AGREEMENT,
      page: () => const UserAgreementView(),
      binding: UserAgreementBinding(),
    ),
    GetPage(
      name: _Paths.YOUR_AVATAR,
      page: () => const YourAvatarView(),
      binding: YourAvatarBinding(),
    ),
    GetPage(
      name: _Paths.PLAY,
      page: () => const PlayView(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: _Paths.PLAYER_WINS_ALL_TIES,
      page: () => const PlayerWinsAllTiesView(),
      binding: PlayerWinsAllTiesBinding(),
    ),
    GetPage(
      name: _Paths.CARD_SCREEN,
      page: () => const CardScreenView(),
      binding: CardScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.LEARN,
      page: () => const LearnView(),
      binding: LearnBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => const StoreView(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: _Paths.LEARN_VIDEO,
      page: () => const LearnVideoView(),
      binding: LearnVideoBinding(),
    ),
  ];
}
