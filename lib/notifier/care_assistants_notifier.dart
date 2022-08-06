
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/CareAssistants.dart';

class CareAssistantsNotifier with ChangeNotifier {
  List<CareAssistants> _careAssistantsList = [];
  CareAssistants _currentCareAssistants;

  UnmodifiableListView<CareAssistants> get careAssistantsList => UnmodifiableListView(_careAssistantsList);

  CareAssistants get currentCareAssistants => _currentCareAssistants;

  set careAssistantsList(List<CareAssistants> careAssistantsList) {
    _careAssistantsList = careAssistantsList;
    notifyListeners();
  }

  set currentCareAssistants(CareAssistants careAssistants) {
    _currentCareAssistants = careAssistants;
    notifyListeners();
  }

}