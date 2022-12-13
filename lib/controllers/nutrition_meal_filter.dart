import 'package:get/get.dart';

class NutritionMealFilterController extends GetxController {
  static NutritionMealFilterController instance = Get.find();
  var nutritionCategory = [].obs;
  var mealCategory = [].obs;

  void clearFilters() {
    nutritionCategory.clear();
    mealCategory.clear();
  }
}
