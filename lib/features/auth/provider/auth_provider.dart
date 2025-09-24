import 'package:complete_firebase/features/core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  String? errorMessage;

  bool isClicked = false;

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
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }
}
