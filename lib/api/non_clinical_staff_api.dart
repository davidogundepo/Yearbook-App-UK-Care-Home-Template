import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/NCStaff.dart';
import '../notifier/non_clinical_staff_notifier.dart';

getNCStaff(NCStaffNotifier nCStaffNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('NCStaff')
      .orderBy('name')
      .get();

  List<NCStaff> _nCStaffList = [];

  snapshot.docs.forEach((document) {
    NCStaff nCStaff = NCStaff.fromMap(document.data());
    _nCStaffList.add(nCStaff);
  });

  nCStaffNotifier.nCStaffList = _nCStaffList;
}
