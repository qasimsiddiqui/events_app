import 'package:events_app/database/userServices.dart';
import 'package:events_app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  UserServices _userservices = UserServices();

  List<UserModel> users = [];

  UserProvider.initialze() {
    _loadusers();
  }

  _loadusers() async {
    users = await _userservices.loadAllusers();
    notifyListeners();
  }
}
