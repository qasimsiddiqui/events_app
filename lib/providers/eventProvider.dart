import 'package:events_app/database/eventServices.dart';
import 'package:events_app/models/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier {
  late FirebaseAuth _auth;
  EventServices _eventServices = new EventServices();
  List<EventModel> events = [];

  //EventModel _eventModel;
  //User _user;

  final formkey = GlobalKey<FormState>();
  TextEditingController eventname = TextEditingController();
  TextEditingController eventaddress = TextEditingController();
  TextEditingController discription = TextEditingController();
  String id = "";
  String eventdate = "";
  String image = "";
  String heldby = "";
  String startime = "";
  String endtime = "";
  int participants = 0;
  int intrestcount = 0;
  bool isonline = false;

  //EventModel get eventModel => _eventModel;
  //User get user => _user;

  EventProvider.initialize() {
    _loadevents();
  }

  _loadevents() async {
    events = await _eventServices.loadallEvents();
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<bool> createEvent() async {
    _auth = FirebaseAuth.instance;
    try {
      // await _auth
      //     .createUserWithEmailAndPassword(
      //         email: "Huzaifashakeel778@gmail.com", password: "123123123")
      //     .then((value) {
      Map<String, dynamic> values = {
        "name": eventname.text,
        "description": discription.text,
        "location": eventaddress.text,
        "date": eventdate,
        "image": "none",
        "heldby": 'Huzaifa Shakeel',
        "heldbySociety": 'IEEE',
        "startime": startime,
        "endtime": endtime,
        "Intrest_count": 4,
        "participants": participants,
        "isonline": isonline
      };
      print("adding Event");
      _eventServices.createEvent(values);
      clearControllers();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void clearControllers() {
    eventname.text = "";
    eventaddress.text = "";
    eventdate = "";
  }

  // Future<bool> CreateSocEvent() async {
  //   _auth = FirebaseAuth.instance;
  //   try {
  //     // await _auth
  //     //     .createUserWithEmailAndPassword(
  //     //         email: "Huzaifashakeel778@gmail.com", password: "123123123")
  //     //     .then((value) {
  //     Map<String, dynamic> values = {
  //       "name": eventname.text,
  //       "description": discription.text,
  //       "location": eventaddress.text,
  //       "date": eventdate,
  //       "image": "none",
  //       "heldby": 'Huzaifa Shakeel',
  //       "heldbySociety": 'IEEE',
  //       "startime": startime,
  //       "endtime": endtime,
  //       "Intrest_count": 4,
  //       "participants": participants,
  //       "isonline": isonline
  //     };
  //     print("adding Event");
  //     _eventServices.createSocietyEVent(values);
  //     clearControllers();
  //     return true;
  //   } catch (e) {
  //     print(e.toString());
  //     return false;
  //   }
//  }
}
