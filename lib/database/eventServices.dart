import 'package:cloud_firestore/cloud_firestore.dart';

class EventServices {
  String eventcollection = 'Events';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference events = FirebaseFirestore.instance.collection('Events');

  void createEvent(Map<String, dynamic> values) {
    _firestore.collection(eventcollection).doc().set(values);
  }

  // void update_user(Map<String, dynamic> values) {
  //   _firestore.collection(eventcollection).doc(values['id']).update(values);
  // }
}
