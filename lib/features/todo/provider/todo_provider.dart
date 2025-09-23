import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_firebase/features/category/pages/add_categories.dart';
import 'package:complete_firebase/features/core/utils.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  final _firebaseStore = FirebaseFirestore.instance;

  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;

  String? errorMessage;

  Future<void> addTodo(String id, String title, String content) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      final data = {"id": id, "title": title, "content": content};
      print(data);

      await _firebaseStore.collection("todo").add(data);
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }
}
