import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<Exception, UserCredential>> loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(e);
    }
  }

  // Sign up with Email and Password
  Future<Either<Exception, UserCredential>> signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> changePassword(String newPassword) async {
    User user = _firebaseAuth.currentUser;
    try {
      var res = await user.updatePassword(newPassword);
      return Right(res);
    } catch (error) {
      return Left(error);
    }
  }

  Future<Either<Exception,void>> resetPassword(String newPassword) async {
    User user = _firebaseAuth.currentUser;
    try {
      var res = await _firebaseAuth.sendPasswordResetEmail(email: user.email);
      return Right(res);
    } catch (error) {
      return Left(error);
    }
  }

  // Sign Out
  Future signOut() async {
    await _firebaseAuth.signOut();
    return true;
  }
}
