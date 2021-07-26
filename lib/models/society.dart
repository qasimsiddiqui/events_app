import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SocietyModel {
  static const ID = "id";
  static const NAME = "name";
  static const DESCRIPTION = "description";
  static const PROFILEIMAGE = "profileimage";
  static const COVERIMAGE = "coverimage";
  static const UNIVERSITY = "university";
  static const DEPARTMENT = "department";
  static const CREATIONDATE = "creationdate";
  static const HELDEVENTS = "heldevents";
  static const UPCOMINGEVENTS = "upcomingevents";
  static const MEMBERS = "members";
  static const ADMIN = "admin";
  static const GOALS = "goals";
  static const TYPE = "type";

  String _id = "";
  String _name = "";
  String _description = "";
  String _university = "";
  String _profileimage = "";
  String _coverimage = "";
  String _creationdate = "";
  String _goals = "";
  String _type = "";
  String _department = "";
  late UserModel _admin;
  List<EventModel> _heldevents = [];
  List<EventModel> _upcomingevents = [];
  List<UserModel> _members = [];
  //String _likedsocieties;

//  getters
  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get university => _university;
  String get profileimage => _profileimage;
  String get coverimage => _coverimage;
  String get creationdate => _creationdate;
  String get goals => _goals;
  String get type => _type;
  String get department => _department;
  UserModel get admin => _admin;
  List<EventModel> get heldevents => _heldevents;
  List<EventModel> get upcomingevents => _upcomingevents;
  List<UserModel> get members => _members;

  SocietyModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _id = snapshot.data()![ID];
    _name = snapshot.data()![NAME];
    _description = snapshot.data()![DESCRIPTION];
    _university = snapshot.data()![UNIVERSITY];
    _department = snapshot.data()![DEPARTMENT];
    _profileimage = snapshot.data()![PROFILEIMAGE];
    _coverimage = snapshot.data()![COVERIMAGE];
    _creationdate = snapshot.data()![CREATIONDATE];
    _goals = snapshot.data()![GOALS];
    _type = snapshot.data()![TYPE];
    _heldevents = snapshot.data()![HELDEVENTS];
    _upcomingevents = snapshot.data()![UPCOMINGEVENTS];
    _members = snapshot.data()![MEMBERS];
    _admin = snapshot.data()![ADMIN];
  }
}
