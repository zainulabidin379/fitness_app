import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentTab = 0.obs;

  void navigateTo(int tab) {
    currentTab.value = tab;
  }
}
