import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hi_matchem_lo_card_game/app/common/cm/cm.dart';
import 'package:hi_matchem_lo_card_game/app/common/const_var/const_var.dart';
import 'package:hi_matchem_lo_card_game/app/theme/theme_data/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

void main() {
  const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    // For iOS: (dark icons)
    statusBarIconBrightness: Brightness.dark,
    // For Android(M and greater): (dark icons)
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => ResponsiveSizer(
          builder: (buildContext, orientation, screenType) => GestureDetector(
            onTap: () => Cm.unFocsKeyBoard(),
            child: GetMaterialApp(
              title: "Hi Matchem Lo Card Game",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              theme: AppThemeData.kNPThemeData(fontFamily: ConstVar.fugazOneFontFamily),
              defaultTransition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 200),
            ),
          ),
        ),
      ),
    );
  });
}



// class CardAnimationExample extends StatefulWidget {
//   @override
//   _CardAnimationExampleState createState() => _CardAnimationExampleState();
// }
//
// class _CardAnimationExampleState extends State<CardAnimationExample> {
//   List<bool> _isCardSet = [false, false, false]; // Tracks if each card is set
//   List<Offset> _cardOffsets = [Offset(5, 5), Offset(10, 10),Offset(15, 15)]; // Predefined offsets for stacking
//
//   void _onCardTap(int index) {
//     setState(() {
//       _isCardSet[index] = true; // Set the tapped card
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Red Card (Bottom Card)
//           Positioned(
//             top: 50,
//             child: Container(
//               width: 84,
//               height: 114,
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'L',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.yellow,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '8',
//                     style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Three Card Images (Stacking on Top)
//           for (int i = 0; i < 3; i++)
//             AnimatedPositioned(
//               duration: Duration(seconds: 1),
//               curve: Curves.easeInOut,
//               // top: _isCardSet[i] ? 50 + _cardOffsets[i].dy : 200,
//               left: _isCardSet[i] ? 155 + _cardOffsets[i].dx : i * 80 + 80.0,
//               top: _isCardSet[i] ? 50 + _cardOffsets[i].dy : 196,
//               // left: _isCardSet[i] ? 150 : i * 80 + 80.0,
//               child: GestureDetector(
//                 onTap: () => !_isCardSet[i] ? _onCardTap(i) : null, // Set the card if it's not already set
//                 child: Transform.scale(
//                   scale: 0.9, // Adjust scale to make card smaller
//                   child: CardWidget(cardNumber: i + 1),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// class CardWidget extends StatelessWidget {
//   final int cardNumber;
//
//   const CardWidget({required this.cardNumber});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           '$cardNumber',
//           style: TextStyle(
//             fontSize: 36,
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }


