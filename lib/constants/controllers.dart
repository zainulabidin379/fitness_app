import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/controllers/nutrition_meal_filter.dart';
import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:fitness_app/controllers/set_workout_filter.dart';
import 'package:fitness_app/controllers/workout_videos_filter.dart';

AuthController authController = AuthController.instance;
BottomNavController bottomNavController = BottomNavController.instance;
QuestionsController questionsController = QuestionsController.instance;
WorkoutVideoFilterController workoutVideoFilterController = WorkoutVideoFilterController.instance;
SetWorkoutFilterController setWorkoutFilterController = SetWorkoutFilterController.instance;
NutritionMealFilterController nutritionMealFilterController = NutritionMealFilterController.instance;