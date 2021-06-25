import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/modules/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModal? _user;

  get user => _user!;

  void setUser(BuildContext context, UserModal? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  void logout(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    instance.remove("user");
    _user = null;
    Navigator.pushReplacementNamed(context, "/login");
  }

  Future<void> saveUser(UserModal user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());

    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModal.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
