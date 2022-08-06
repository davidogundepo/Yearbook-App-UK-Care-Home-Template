
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/CareHomeArial.dart';

class CareHomeArialNotifier with ChangeNotifier {
  List<CareHomeArial> _careHomeArialList = [];
  CareHomeArial _currentCareHomeArial;

  UnmodifiableListView<CareHomeArial> get careHomeArialList => UnmodifiableListView(_careHomeArialList);

  CareHomeArial get currentCareHomeArial => _currentCareHomeArial;

  set careHomeArialList(List<CareHomeArial> careHomeArialList) {
    _careHomeArialList = careHomeArialList;
    notifyListeners();
  }

  set currentCareHomeArial(CareHomeArial careHomeArial) {
    _currentCareHomeArial = careHomeArial;
    notifyListeners();
  }

}