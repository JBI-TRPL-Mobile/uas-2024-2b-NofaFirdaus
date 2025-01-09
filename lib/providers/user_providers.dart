import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_project/models/user.dart';

class UserProviders with ChangeNotifier{
 List<User> _users = [];
  List<User> get users => _users;

     Future<void> fetchUser() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final Map<String, dynamic> data = json.decode(response);
    
    final List<User> loadedUSer = [];
    for (var item in data['data']) {
      loadedUSer.add(User.fromJson(item));
    }
    
    _users = loadedUSer;
    
    notifyListeners();
    
  }
User? authenticate(String email, String password) {
  try {
    
    return _users.firstWhere(
      (user) => user.email == email && user.password == password,
    );
  } catch (e) {
    return null;
  } 
}

  // Future<void> addUser() async {
  //   final String response = await rootBundle.loadString('assets/users.json');
  //   final Map<String, dynamic> data = json.decode(response);
    
  //   final List<User> loadedUSer = [];
  //   for (var item in data['data']) {
  //     loadedUSer.add(User.fromJson(item));
  //   }
    
  //   users = loadedUSer;
    
  //   notifyListeners();
  // }

}