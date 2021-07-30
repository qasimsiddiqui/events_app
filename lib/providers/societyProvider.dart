import 'package:events_app/database/societyServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SocietyProvider with ChangeNotifier {
  late FirebaseAuth _auth;
  SocietyServices _societyServices = SocietyServices();

  TextEditingController societyname = TextEditingController();
  TextEditingController societyuniversity = TextEditingController();
  TextEditingController goals = TextEditingController();
  String type = "";
  String department = "";
  DateTime societyCreationTime = DateTime.now();

  SocietyProvider.initialize() {
    print("Initialized");
  }

  Future<bool> createSociety() async {
    _auth = FirebaseAuth.instance;
    try {
      Map<String, dynamic> values = {
        "id": "234",
        "name": societyname.text,
        "university": societyuniversity.text,
        "goals": goals.text,
        "type": type,
        "department": department,
        "creationdate": societyCreationTime,
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
