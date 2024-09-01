import 'package:get/get.dart';

class StoreController extends GetxController {

  final count = 0.obs;

  List<Map<String,String>> data= [
    {'CardName': 'Top OFF','CardAmount':'350','InDollar':'\$3.99'},
    {'CardName': 'Play More','CardAmount':'1000','InDollar':'\$9.99'},
    {'CardName': 'High Stakes','CardAmount':'2599','InDollar':'\$19.99'}
  ];

  @override
  void onInit() {
    super.onInit();
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
