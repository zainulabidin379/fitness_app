import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/widgets/wrapper.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  var isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  String getCurrentUser() {
    final User user = auth.currentUser!;
    final uid = user.uid;

    return uid;
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      isLoggedIn.value = true;
      Get.offAll(() => WrapperScreen());
    } else {
      // user is not logged in
      isLoggedIn.value = false;
      Get.offAll(() => WrapperScreen());
    }
  }

  Future register(String email, String password) async {
    try {
      print("im here");
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print("im here 2");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          return "Email already used. Go to login page.";

        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          return "Wrong email/password combination.";

        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          return "No user found with this email.";

        case "ERROR_USER_DISABLED":
        case "user-disabled":
          return "User disabled.";

        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          return "Too many requests to log into this account.";

        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          return "Email address is invalid.";

        default:
          return "Login failed. Please try again.";
      }
    }
    return null;
  }

  Future login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          return "Email already used. Go to login page.";

        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          return "Wrong email/password combination.";

        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          return "No user found with this email.";

        case "ERROR_USER_DISABLED":
        case "user-disabled":
          return "User disabled.";

        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          return "Too many requests to log into this account.";

        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          return "Email address is invalid.";

        default:
          return "Login failed. Please try again.";
      }
    }
    return null;
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
