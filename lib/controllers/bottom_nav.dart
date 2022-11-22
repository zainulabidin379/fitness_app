import 'package:get/get.dart';

class BottomNavController extends GetxController {
  static BottomNavController instance = Get.find();
  var currentTab = 1.obs;

  void navigateTo(int tab) {
    currentTab.value = tab;
  }
}
