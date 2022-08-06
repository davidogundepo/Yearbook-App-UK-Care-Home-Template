import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/CareAssistants.dart';
import '../notifier/care_assistants_notifier.dart';

getCareAssistants(CareAssistantsNotifier careAssistantsNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('CareAssistants')
      .orderBy('name')
      .get();

  List<CareAssistants> _careAssistantsList = [];

  snapshot.docs.forEach((document) {
    CareAssistants careAssistants = CareAssistants.fromMap(document.data());
    _careAssistantsList.add(careAssistants);
  });

  careAssistantsNotifier.careAssistantsList = _careAssistantsList;
}
