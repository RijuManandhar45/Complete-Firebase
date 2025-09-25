import 'package:complete_firebase/features/core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  String? errorMessage;

  bool isClicked = false;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    Future.microtask(() {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _statusUtils = StatusUtils.sucess;
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> signin(String email, String password) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPreferences.getInstance();
      // mobile ko local storage access garna lai
      await prefs.setBool("isLoggedIn", true);

      _isLoggedIn = true;

      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("isLoggedIn");
    await prefs.setBool("isLoggedIn", false);
    _statusUtils = StatusUtils.idle;
    _isLoggedIn = false;
    notifyListeners();
  }
}
