import 'package:get/get.dart';

class WorkoutVideoFilterController extends GetxController {
  static WorkoutVideoFilterController instance = Get.find();
  var difficultyLevel = [].obs;
  var muscleGroup = [].obs;
  var equipment = [].obs;
  var location = [].obs;

  void clearFilters() {
    difficultyLevel.clear();
    muscleGroup.clear();
    equipment.clear();
    location.clear();
  }
}
