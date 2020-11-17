
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService _userService = locator<UserService>();

  AppUser _currentUser;

  AppUser get currentUser => _currentUser;

  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await populateCurrentUser(result.user);

      return result.user != null;
    } catch (e) {
      return e.message;
    }
  }

  // Sign up with Email and Password
  Future signUpWithEmail(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String imageUrl,
      @required String phone}) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      const String avater =
          'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png';
      _currentUser = AppUser(
          id: result.user.uid,
          email: email,
          fullName: fullName,
          phone: phone,
          imageUrl: avater);

      //Create a new user
      await _userService.createUser(_currentUser);

      return result.user != null;
    } catch (e) {
      return e.message;
    }
  }

  // Gets the current user
  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await populateCurrentUser(user);
    return user != null;
  }

  // Populate the current user
  Future populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _userService.getUser(uid: user.uid);
    }
  }

  Future<bool> changePassword(String newPassword) async {
    User user = _firebaseAuth.currentUser;
    try {
      await user.updatePassword(newPassword);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> resetPassword(String newPassword) async {
    User user = _firebaseAuth.currentUser;
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: user.email);
      return true;
    } catch (error) {
      return false;
    }
  }

  // Sign Out
  Future signOut() async {
    await _firebaseAuth.signOut();
    return true;
  }
}
