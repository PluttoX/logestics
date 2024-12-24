import 'dart:async';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logestics/core/shared_services/firebase_auth_service.dart';
import '../../../../core/utils/app_constants/texts/app__authentication_texts_expended.dart';
import '../../domain/entities/auth_failer.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl(this.firebaseAuthService);

  @override
  Future<Either<AuthFailure, UserCredential>> login(
      String email, String password) async {
    try {
      // Call the authentication service for login
      var userCredential = await firebaseAuthService
          .login(email: email, password: password)
          .timeout(
            Duration(seconds: 10),
            onTimeout: () =>
                throw TimeoutException(AppAuthenticationTextsExpended.timeout),
          );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      // Firebase specific error handling
      switch (e.code) {
        case 'user-not-found':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              message: AppAuthenticationTextsExpended.noUserFound));
        case 'wrong-password':
          return Left(AuthFailure(
              field: 'password',
              code: e.code,
              message: AppAuthenticationTextsExpended.incorrectPassword));
        case 'invalid-email':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              message: AppAuthenticationTextsExpended.invalidEmail));
        case 'user-disabled':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              message: AppAuthenticationTextsExpended.userDisabled));
        case 'too-many-requests':
          return Left(AuthFailure(
              code: e.code,
              message: AppAuthenticationTextsExpended.tooManyRequests));
        case 'network-request-failed':
          return Left(AuthFailure(
              code: e.code,
              message: AppAuthenticationTextsExpended.networkError));
        case 'invalid-credential':
          return Left(AuthFailure(
              code: e.code,
              message: AppAuthenticationTextsExpended.invalidCredential));
        default:
          return Left(AuthFailure(
              code: e.code,
              message:
                  "${AppAuthenticationTextsExpended.authError} ${e.code} ${e.message}"));
      }
    } on TimeoutException catch (e) {
      // Handle timeout error
      return Left(AuthFailure(
          message:
              "${AppAuthenticationTextsExpended.timeoutError} ${e.message}"));
    } on SocketException {
      // Handle no internet connection
      return Left(
          AuthFailure(message: AppAuthenticationTextsExpended.noInternet));
    } catch (e) {
      // Generic error handling
      return Left(AuthFailure(
          message:
              "${AppAuthenticationTextsExpended.unexpectedError} ${e.toString()}"));
    }
  }

  @override
  Future<Either<AuthFailure, void>> sendPasswordResetEmail(
      String email) async {
    try {
      // Send the password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).timeout(
            Duration(seconds: 10),
            onTimeout: () =>
                throw TimeoutException(AppAuthenticationTextsExpended.timeout),
          );

      return const Right(null); // Success
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      switch (e.code) {
        case 'invalid-email':
          return Left(AuthFailure(
            field: 'email',
            message: AppAuthenticationTextsExpended.invalidEmail,
          ));
        case 'user-not-found':
          return Left(
            AuthFailure(
              field: 'email',
              message: AppAuthenticationTextsExpended.noUserFound,
            ),
          );
        case 'user-disabled':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              message: AppAuthenticationTextsExpended.userDisabled));
        case 'too-many-requests':
          return Left(AuthFailure(
              code: e.code,
              message: AppAuthenticationTextsExpended.tooManyRequests));
        case 'network-request-failed':
          return Left(AuthFailure(
              code: e.code,
              message: AppAuthenticationTextsExpended.networkError));
        case 'invalid-credential':
          return Left(AuthFailure(
              code: e.code,
              message: AppAuthenticationTextsExpended.invalidCredential));
        default:
          return Left(AuthFailure(
            message:
                "${AppAuthenticationTextsExpended.authError} ${e.code} ${e.message}",
          ));
      }
    } on TimeoutException catch (e) {
      // Handle timeout error
      return Left(AuthFailure(
        message: "${AppAuthenticationTextsExpended.timeoutError} ${e.message}",
      ));
    } on SocketException {
      // Handle no internet connection
      return Left(AuthFailure(
        message: AppAuthenticationTextsExpended.noInternet,
      ));
    } catch (e) {
      // Generic error handling
      return Left(AuthFailure(
        message:
            "${AppAuthenticationTextsExpended.unexpectedError} ${e.toString()}",
      ));
    }
  }

  @override
  Future<void> enableLocalPersistence(persistence) async {
    await firebaseAuthService.enableLocalPersistence(persistence: persistence);
  }
  @override
  Future<Either<AuthFailure, void>> signOut() async {
    try {
      await firebaseAuthService.signOut(); // Call to FirebaseAuthService
      return const Right(null); // Sign out successful
    } on TimeoutException catch (e) {
      return Left(AuthFailure(
          message: "Timeout occurred: ${e.message ?? "unknown"}"));
    } catch (e) {
      return Left(AuthFailure(message: "Unexpected error: ${e.toString()}"));
    }
  }

}
