
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/NCStaff.dart';

class NCStaffNotifier with ChangeNotifier {
  List<NCStaff> _nCStaffList = [];
  NCStaff _currentNCStaff;

  UnmodifiableListView<NCStaff> get nCStaffList => UnmodifiableListView(_nCStaffList);

  NCStaff get currentNCStaff => _currentNCStaff;

  set nCStaffList(List<NCStaff> nCStaffList) {
    _nCStaffList = nCStaffList;
    notifyListeners();
  }

  set currentNCStaff(NCStaff nCStaff) {
    _currentNCStaff = nCStaff;
    notifyListeners();
  }

}