import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/Nurses.dart';


class NursesNotifier with ChangeNotifier {
  List<Nurses> _nursesList = [];
  Nurses _currentNurses;

  UnmodifiableListView<Nurses> get nursesList => UnmodifiableListView(_nursesList);

  Nurses get currentNurses => _currentNurses;

  set nursesList(List<Nurses> nursesList) {
    _nursesList = nursesList;
    notifyListeners();
  }

  set currentNurses(Nurses nurses) {
    _currentNurses = nurses;
    notifyListeners();
  }

}