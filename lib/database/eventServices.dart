import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/event.dart';

class EventServices {
  String eventcollection = 'Events';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference events = FirebaseFirestore.instance.collection('Events');

  void createEvent(Map<String, dynamic> values) {
    _firestore.collection(eventcollection).doc().set(values);
  }

  Future<List<EventModel>> loadallEvents() async =>
      _firestore.collection(eventcollection).get().then((result) {
        List<EventModel> events = [];
        for (DocumentSnapshot<Map<String, dynamic>> event in result.docs) {
          events.add(EventModel.fromSnapshot(event));
        }
        return events;
      });
  // void createSocietyEVent(Map<String, dynamic> values) {
  //   _firestore
  //       .collection("Societies")
  //       .doc('V6NHIUM6TDkupRX70RQ4')
  //       .collection("Events")
  //       .add(values);
  // }

  // void update_user(Map<String, dynamic> values) {
  //   _firestore.collection(eventcollection).doc(values['id']).update(values);
  // }
}
