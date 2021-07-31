import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String usercollection = "Users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<UserModel> users = [];
  late UserModel varifiedUser;
  late UserModel eventhost;
  late bool isvar = false;

  UserProvider.initialze() {
    _loadusers();
  }

  _loadusers() async {
    _firestore.collection(usercollection).get().then((result) {
      for (DocumentSnapshot<Map<String, dynamic>> user in result.docs) {
        users.add(UserModel.fromSnapshot(user));
      }
    });
    notifyListeners();
  }

  getVarifiedUser({required String email}) async {
    _firestore
        .collection(usercollection)
        .where("email", isEqualTo: email)
        .get()
        .then((reult) {
      varifiedUser = UserModel.fromSnapshot(reult.docs.single);
    });
  }

  isuservarified({required String email}) async {
    try {
      await _firestore
          .collection(usercollection)
          .where("email", isEqualTo: email)
          .get()
          .then((reult) {
        if (reult.docs.first.data().isEmpty)
          isvar = false;
        else
          isvar = true;
      });
    } catch (e) {
      print(e);
      isvar = false;
    }
  }

  Future getuserbyid({required String id}) async {
    await _firestore
        .collection(usercollection)
        .where("id", isEqualTo: id)
        .get()
        .then((doc) {
      eventhost = UserModel.fromSnapshot(doc.docs.first);
    });
  }

  getUserByID({required String id}) async =>
      await _firestore.collection(usercollection).doc(id).get().then((doc) {
        print("printing docomentdata\n\n");
        print(doc.data());
        eventhost = UserModel.fromSnapshot(doc);
      });

  Future<bool> createUser(
      String username,
      String usercity,
      String userInsta,
      String useruni,
      String userdepartment,
      String userDOB,
      String userbio,
      String phno,
      String email,
      String profileimage,
      String coverimage,
      String userid) async {
    try {
      Map<String, dynamic> values = {
        "name": username,
        "address": usercity,
        "instagramID": userInsta,
        "university": useruni,
        "department": userdepartment,
        "dateofbirth": "10-12-1998",
        "bio": userbio,
        "phonenumber": phno,
        "email": email,
        "profileimage": "",
        "coverimage": "",
        "id": userid,
      };

      _firestore.collection(usercollection).doc().set(values);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
