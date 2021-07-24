import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/user.dart';

class SocietyModel {
  static const ID = "id";
  static const NAME = "name";
  static const DESCRIPTION = "description";
  static const PROFILEIMAGE = "profileimage";
  static const COVERIMAGE = "coverimage";
  static const UNIVERSITY = "university";
  static const DATE = "date";
  static const HELDEVENTS = "heldevents";
  static const MEMBERS = "members";

  String _id = "";
  String _name = "";
  String _description = "";
  String _university = "";
  String _profileimage = "";
  String _coverimage = "";
  String _date = "";
  List<EventModel> _heldevents = [];
  List<UserModel> _members = [];
  //String _likedsocieties;

//  getters
  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get university => _university;
  String get profileimage => _profileimage;
  String get coverimage => _coverimage;
  String get date => _date;
  List<EventModel> get heldevents => _heldevents;
  List<UserModel> get members => _members;

  SocietyModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _id = snapshot.data()![ID];
    _name = snapshot.data()![NAME];
    _description = snapshot.data()![DESCRIPTION];
    _university = snapshot.data()![UNIVERSITY];
    _profileimage = snapshot.data()![PROFILEIMAGE];
    _coverimage = snapshot.data()![COVERIMAGE];
    _date = snapshot.data()![DATE];
    _heldevents = snapshot.data()![HELDEVENTS];
    _members = snapshot.data()![MEMBERS];
  }
}
