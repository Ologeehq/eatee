import 'package:dartz/dartz.dart';
import 'package:eatee/core/glitch/auth_exception.dart';

import 'package:eatee/core/services/authentication.dart';
import 'package:eatee/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  final _authService = locator<AuthenticationService>();

  Future<Either<String, User>> createAccountEmailPassword({
    @required String email,
    @required String password,
  }) async {
    final result =
        await _authService.signUpWithEmail(email: email, password: password);

    return result.fold((l) {
      return Left(AuthExceptionHandler.generateExceptionMessage(
          AuthExceptionHandler.handleException(l)));
    }, (res) {
      return Right(res.user);
    });
  }

  Future<Either<String, User>> loginAccountEmail({
    @required String email,
    @required String password,
  }) async {
    final result =
        await _authService.loginWithEmail(email: email, password: password);
    return result.fold((l) {
      return Left(AuthExceptionHandler.generateExceptionMessage(
          AuthExceptionHandler.handleException(l)));
    }, (res) {
      return Right(res.user);
    });
  }

  
}
