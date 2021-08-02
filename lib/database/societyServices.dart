import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/society.dart';

class SocietyServices {
  String societycollection = "Societies";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference events =
      FirebaseFirestore.instance.collection('Societies');

  void createSociety(Map<String, dynamic> values) {
    _firestore.collection(societycollection).doc().set(values);
  }

  Future<List<SocietyModel>> loadAllSocities() async =>
      _firestore.collection(societycollection).get().then((result) {
        List<SocietyModel> socities = [];
        for (DocumentSnapshot<Map<String, dynamic>> user in result.docs) {
          socities.add(SocietyModel.fromSnapshot(user));
        }
        return socities;
      });
}
