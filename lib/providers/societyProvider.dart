import 'package:events_app/database/societyServices.dart';
import 'package:events_app/models/society.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SocietyProvider with ChangeNotifier {
  SocietyServices _societyServices = SocietyServices();

  List<SocietyModel> socities = [];

  TextEditingController societyname = TextEditingController();
  TextEditingController societyuniversity = TextEditingController();
  TextEditingController goals = TextEditingController();
  String type = "";
  String department = "";
  DateTime SocietyCreationTime = DateTime.now();

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
        "university": societyuniversity.text,
        "goals": goals.text,
        "type": type,
        "department": department,
        "creationdate": SocietyCreationTime,
        "admin": "Qasim Siddiqui",
      };
      _societyServices.createSociety(values);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
