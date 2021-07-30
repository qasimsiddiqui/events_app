import 'package:events_app/database/userServices.dart';
import 'package:events_app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController userBio = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userUniversity = TextEditingController();
  TextEditingController userDepartment = TextEditingController();
  TextEditingController userPhNo = TextEditingController();
  TextEditingController userInsta = TextEditingController();
  String userDOB = "";
  String userEmail = "";
  final formkey = GlobalKey<FormState>();
  UserServices _userservices = UserServices();

  List<UserModel> users = [];
  late UserModel varifiedUser;
  late UserModel eventhost;
  late bool isvar = false;

  UserProvider.initialze() {
    _loadusers();
  }

  _loadusers() async {
    users = await _userservices.loadAllusers();
    notifyListeners();
  }

  // ignore: unused_element
  Future getVarifiedUser({required String email}) async {
    varifiedUser = await _userservices.getuserByEmail(email: email);
  }

  Future isuservarified({required String email}) async {
    isvar = await _userservices.ifUserVarified(email: email);
  }

  Future getuserbyuid({required String uid}) async {
    print(
        "printing eventhost object\nprinting eventhost object\nprinting eventhost object\nprinting eventhost object");

    eventhost = await _userservices.getUserByUID(uid: uid);
  }

  Future<bool> createUser() async {
    try {
      Map<String, dynamic> values = {
        "name": userName.text,
        "address": userCity.text,
        "instagramID": userInsta.text,
        "university": userUniversity.text,
        "department": userDepartment.text,
        "dateofbirth": "10-12-1998",
        "bio": userBio.text,
        "phonenumber": userPhNo.text,
        "email": userEmail,
        "profileimage": "",
        "coverimage": ""
      };
      _userservices.addUser(values);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void clearControllers() {
    userBio.text = "";
    userCity.text = "";
    userDOB = "";
    userDepartment.text = "";
    userInsta.text = "";
    userName.text = "";
    userPhNo.text = "";
    userUniversity.text = "";
  }
}
