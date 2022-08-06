
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/CareHomeArial.dart';
import '../notifier/care_home_arial_notifier.dart';

getCareHomeArial(CareHomeArialNotifier careHomeArialNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('CareHomeArial').get();

  List<CareHomeArial> _careHomeArialList = [];

  snapshot.docs.forEach((document) {
    CareHomeArial careHomeArial = CareHomeArial.fromMap(document.data());
    _careHomeArialList.add(careHomeArial);
  });

  careHomeArialNotifier.careHomeArialList = _careHomeArialList;
}