import 'package:events_app/database/userServices.dart';
import 'package:events_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  UserServices _userservices = UserServices();
  late FirebaseAuth _auth;

  List<UserModel> users = [];

  UserProvider.initialze() {
    _loadusers();
  }

  _loadusers() async {
    users = await _userservices.loadAllusers();
    notifyListeners();
  }

  Future<bool> createUser() async {
    try {
      Map<String, dynamic> values = {
        "name": "Huzaifa Shakeel 2.0",
        "address": "DG khan",
        "instagramID": "huzaifashakeel_",
        "university": "UET Taxila",
        "department": "CS",
        "dateofbirth": "10-12-1998",
        "bio": "Your Father",
        "phonenumber": "03324247031"
      };
      _userservices.addUser(values);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
