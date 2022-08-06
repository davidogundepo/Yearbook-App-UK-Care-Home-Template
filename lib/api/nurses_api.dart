import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../model/Nurses.dart';
import '../notifier/nurses_notifier.dart';

getNurses(NursesNotifier nursesNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Nurses')
      .orderBy('name')
      .get();

  List<Nurses> _nursesList = [];

  snapshot.docs.forEach((document) {
    Nurses nurses = Nurses.fromMap(document.data());
    _nursesList.add(nurses);
  });

  nursesNotifier.nursesList = _nursesList;
}
