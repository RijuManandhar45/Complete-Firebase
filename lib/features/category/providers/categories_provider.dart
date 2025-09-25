import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_firebase/features/core/utils.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  final _firebaseStore = FirebaseFirestore.instance;
  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;

  String? errorMessage;

  List<Map<String, dynamic>> _categoriesList = [];
  List<Map<String, dynamic>> get categoriesList => _categoriesList;

  Future<void> addCategories(
      String category,
      String rating,
      String title,
      String classes,
      String durationHours,
      String price,
      String tab,
      String conclusion) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      final data = {
        "category": category,
        "rating": rating,
        "title": title,
        "classes": classes,
        "duration hours": durationHours,
        "price": price,
        "tab": tab,
        "conclusion": conclusion
      };
      print(data);

      await _firebaseStore.collection("addCategory").add(data);
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> fetchCourses() async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();
    try {
      final snapshot = await _firebaseStore.collection("addCategory").get();
      _categoriesList = snapshot.docs
          .map((categories) => {"id": categories.id, ...categories.data()})
          .toList();
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }
}
