import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/user.dart';

class UserServices {
  String usercollection = "Users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addUser(Map<String, dynamic> values) async {
    _firestore.collection(usercollection).add(values);
  }

  Future<List<UserModel>> loadAllusers() async =>
      _firestore.collection(usercollection).get().then((result) {
        List<UserModel> users = [];
        for (DocumentSnapshot<Map<String, dynamic>> user in result.docs) {
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });
}
