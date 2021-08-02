import 'package:events_app/database/societyServices.dart';
import 'package:events_app/models/society.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SocietyProvider with ChangeNotifier {
  late FirebaseAuth _auth;
  SocietyServices _societyServices = SocietyServices();

  List<SocietyModel> socities = [];
  final formkey = GlobalKey<FormState>();
  TextEditingController societyname = TextEditingController();
  TextEditingController societyuniversity = TextEditingController();
  TextEditingController goals = TextEditingController();
  TextEditingController societydescription = TextEditingController();
  String adminName = "";
  String adminUID = "";
  String type = "";
  String department = "";
  DateTime societyCreationTime = DateTime.now();

  SocietyProvider.initialize() {
    _loadSocities();
  }

  _loadSocities() async {
    socities = await _societyServices.loadAllSocities();
  }

  Future<bool> createSociety() async {
    try {
      Map<String, dynamic> values = {
        "id": "234",
        "name": societyname.text,
        "description": societydescription.text,
        "university": societyuniversity.text,
        "goals": goals.text,
        "type": type,
        "department": department,
        "creationdate": societyCreationTime,
        "admin": adminName,
        "adminUid": adminUID,
        "profileimage": "",
        "coverimage": ""
      };
      _societyServices.createSociety(values);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  clearControllers() {
    societyname.text = "";
    societydescription.text = "";
    societyuniversity.text = "";
    goals.text = "";
  }
}
