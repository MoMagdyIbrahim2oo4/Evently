import 'package:evently/core/utils/firebase_utils.dart';
import 'package:evently/data/model/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? errorMessage;
  AppUser? currentUser;
  bool isLoading = true;

  Future<bool> register({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      errorMessage = null;
      final user = await FirebaseUtils.register(
        email: email,
        password: password,
        userName: userName,
      );
      currentUser = user;
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage = FirebaseUtils.authErrorMessage(e);
      return false;
    } catch (e) {
      errorMessage = 'something went wrong , try again later';
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      errorMessage = null;
      final user = await FirebaseUtils.login(email: email, password: password);
      currentUser = user;
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage = FirebaseUtils.authErrorMessage(e);
      return false;
    } catch (e) {
      errorMessage = 'something went wrong , try again later';
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      errorMessage = null;
      await FirebaseUtils.logout();
    } on FirebaseAuthException catch (e) {
      errorMessage = FirebaseUtils.authErrorMessage(e);
    } catch (e) {
      errorMessage = 'something went wrong , try again later';
    } finally {
      notifyListeners();
    }
  }

  Future<void> listenToAuthChanges() async {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null) {
        final snapshot = await FirebaseUtils.userCollection()
            .doc(user.uid)
            .get();
        currentUser = snapshot.data();
      } else {
        currentUser = null;
      }
      isLoading = false;
      notifyListeners();
    });
  }
}
