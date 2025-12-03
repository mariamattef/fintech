import 'dart:developer';

import 'package:fintech/core/storage/secure_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._secureStorageService) : super(AuthInitial());

  final SecureStorageService _secureStorageService;

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    emit(AuthLoading());
    try {
      if (password != confirmPassword) {
        emit(AuthFailure('Passwords do not match.'));
        return;
      }

      var credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credentials.user;
      if (user != null) {
        await user.updateDisplayName(firstName);

        // TODO: Save complete user profile (first name, last name, email, phone)
        // to a database like Cloud Firestore here.
        // Example:
        // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        //   'firstName': firstName,
        //   'lastName': lastName,
        //   'email': email,
        //   'phone': phone,
        // });
        final idToken = await user.getIdToken();
        if (idToken != null) {
          await _secureStorageService.saveToken(idToken);
          emit(AuthSuccess(user));
        } else {
          emit(AuthFailure('Failed to retrieve user token after sign up.'));
        }
      } else {
        emit(AuthFailure('User creation failed, please try again.'));
      }
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      if (e.code == 'weak-password') {
        emit(AuthFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure('An account already exists for that email.'));
      } else {
        emit(
          AuthFailure('An error occurred during sign up. Please try again.'),
        );
      }
    } catch (e) {
      log('SignUp Exception: $e');
      emit(AuthFailure('An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user != null) {
        final idToken = await user.getIdToken();
        if (idToken != null) {
          await _secureStorageService.saveToken(idToken);
          emit(AuthSuccess(user));
        } else {
          emit(AuthFailure('Failed to retrieve user token.'));
        }
      } else {
        emit(AuthFailure('Login failed, please try again.'));
      }
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      if (e.code == 'user-not-found') {
        emit(AuthFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure('Wrong password provided for that user.'));
      } else if (e.code == 'user-disabled') {
        emit(AuthFailure('This user has been disabled.'));
      } else if (e.code == 'invalid-credential') {
        emit(AuthFailure('Invalid credentials, please try again.'));
      } else {
        emit(AuthFailure('An error occurred during login. Please try again.'));
      }
    } catch (e) {
      log('Login Exception: $e');
      emit(AuthFailure('An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signOut();
      await _secureStorageService.deleteToken();
      emit(AuthInitial());
    } catch (e) {
      log('Logout Exception: $e');
      emit(AuthFailure('An unexpected error occurred during logout.'));
    }
  }

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      final token = await _secureStorageService.readToken();
      if (token != null) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          log('User found from previous session.');
          emit(AuthSuccess(user));
        } else {
          log('Token found but no user, clearing token.');
          await _secureStorageService.deleteToken();
          emit(AuthInitial());
        }
      } else {
        log('No token found, user is not logged in.');
        emit(AuthInitial());
      }
    } catch (e) {
      log('CheckAuthStatus Exception: $e');
      await _secureStorageService.deleteToken();
      emit(AuthInitial());
    }
  }
}
