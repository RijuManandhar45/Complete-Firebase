import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_firebase/features/core/utils.dart';
import 'package:complete_firebase/features/mentors/pages/add_mentors.dart';
import 'package:complete_firebase/features/mentors/pages/mentors.dart';
import 'package:flutter/material.dart';

class MentorsProvider with ChangeNotifier {
  final _firebaseStore = FirebaseFirestore.instance;

  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;

  String? errorMessage;

  List<Map<String, dynamic>> _mentorList = [];
  List<Map<String, dynamic>> get mentorList => _mentorList;

  Future<void> addCourses(
    String category,
    String rating,
    String title,
    String classes,
    String durationHours,
    String price,
    String tab,
    String conclusion,
  ) async {
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
        "conclusion": conclusion,
      };

      await _firebaseStore.collection("addCourses").add(data);
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> addMentors(Mentors mentors) async {
    handleLoading();

    try {
      await _firebaseStore.collection("addMentors").add(mentors.toJson());
      handleSucess();
    } catch (e) {
      errorMessage = e.toString();
      handleError();
    }
  }

  Future<void> fetchMentors() async {
    handleLoading();
    try {
      final snapShot = await _firebaseStore.collection("addMentors").get();
      _mentorList = snapShot.docs
          .map((mentors) => {"id": mentors.id, ...mentors.data()})
          .toList();
      handleSucess();
    } catch (e) {
      e.toString();
      handleError();
    }
  }

  handleLoading() {
    _statusUtils = StatusUtils.loading;
    notifyListeners();
  }

  handleSucess() {
    _statusUtils = StatusUtils.sucess;
    notifyListeners();
  }

  handleError() {
    _statusUtils = StatusUtils.error;
    notifyListeners();
  }
}
