import 'package:cloud_firestore/cloud_firestore.dart';

class SocietyServices {
  String societycollection = "Societies";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference events =
      FirebaseFirestore.instance.collection('Societies');

  void createSociety(Map<String, dynamic> values) {
    _firestore.collection(societycollection).doc().set(values);
  }
}
