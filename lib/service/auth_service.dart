import 'package:testchat/helper/helper_function.dart';
import 'package:testchat/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      // ignore: unnecessary_null_comparison
      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> updateUsername(String newUsername) async {
    try {
      User? currentUser = firebaseAuth.currentUser;

      await DatabaseService(uid: currentUser!.uid).updateUsername(newUsername);

      // Update the displayName in FirebaseAuth
      await currentUser.updateDisplayName(newUsername);
      await currentUser.reload();
      currentUser = firebaseAuth.currentUser;

      // Save updated user info to SharedPreferences
      await HelperFunctions.saveUserNameSF(currentUser?.displayName ?? "");
    } catch (e) {
      print("Error updating username: $e");
    }
  }

  // signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
