import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/user.dart';

class EventModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const NAME = "name";
  static const LOCATION = "location";
  static const DATE = "date";
  static const IMAGE = "image";
  static const HELDBY = "heldby";
  static const INTRESTS = "Intrest_count";
  static const STARTIME = "startime";
  static const ENDTIME = "endtime";
  static const TOTALPARTICIPANTS = "participants";
  static const LIKEDBY = "likedby";
  static const INTRESTEDMEMBERS = "intrestedmembers";

  String _id = "";
  String _name = "";
  String _description = "";
  String _location = "";
  String _date = "";
  String _image = "";
  String _heldby = "";
  String _startime = "";
  String _endtime = "";
  int _participants = 0;
  int _intrestcount = 0;
  List<UserModel> _intrestedmembers = [];
  List<UserModel> _likedby = [];

//  getters
  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get location => _location;
  String get date => _date;
  String get heldby => _heldby;
  String get image => _image;
  String get startime => _startime;
  String get endtime => _endtime;
  List<UserModel> get likedby => _likedby;
  List<UserModel> get intrestedmembers => _intrestedmembers;
  int get intrestcount => _intrestcount;
  int get participants => _participants;

  EventModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    _id = snapshot.data()![ID];
    _description = snapshot.data()![DESCRIPTION];
    _name = snapshot.data()![NAME];
    _location = snapshot.data()![LOCATION];
    _date = snapshot.data()![DATE];
    _heldby = snapshot.data()![DATE];
    _intrestcount = snapshot.data()![INTRESTS];
    _startime = snapshot.data()![STARTIME];
    _endtime = snapshot.data()![ENDTIME];
    _likedby = snapshot.data()![LIKEDBY];
    _participants = snapshot.data()![TOTALPARTICIPANTS];
    _intrestcount = snapshot.data()![INTRESTS];
    _intrestedmembers = snapshot.data()![INTRESTEDMEMBERS];
  }
}
