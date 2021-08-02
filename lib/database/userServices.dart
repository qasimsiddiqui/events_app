import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  String usercollection = "Users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late UserModel userFromFirebase;

  void addUser(Map<String, dynamic> values) async {
    _firestore.collection(usercollection).add(values);
  }

  Future<List<UserModel>> loadAllusers() async =>
      _firestore.collection(usercollection).get().then((result) {
        List<UserModel> users = [];
        for (DocumentSnapshot<Map<String, dynamic>> user in result.docs) {
          print(user);
          users.add(UserModel.fromSnapshot(user));
        }
        return users;
      });
  Future<bool> ifUserVarified({required String email}) async => _firestore
          .collection(usercollection)
          .where("email", isEqualTo: email)
          .get()
          .then((reult) {
        if (reult.docs.isEmpty)
          return false;
        else
          return true;
      });

  Future<UserModel> getuserByEmail({required String email}) async => _firestore
          .collection(usercollection)
          .where("email", isEqualTo: email)
          .get()
          .then((reult) {
        userFromFirebase = UserModel.fromSnapshot(reult.docs.single);
        return userFromFirebase;
      });

  Future<UserModel> getUserByUID({required String uid}) async => _firestore
          .collection(usercollection)
          .where("id", isEqualTo: uid)
          .get()
          .then((doc) {
        print(
            "getting docoment from firebase\ngetting docoment from firebase\ngetting docoment from firebase");
        print(doc.docs.first.data());

        print(
            "getting usermodel from snapshot\ngetting usermodel from snapshot\ngetting usermodel from snapshot\n");
        print(UserModel.fromSnapshot(doc.docs.first));
        return UserModel.fromSnapshot(doc.docs.first);
      });
}
