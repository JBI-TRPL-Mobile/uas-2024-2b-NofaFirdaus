import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class RegisterController {
  final String userFilePath = 'assets/users.json';

  Future<void> addUser(Map<String, String> userData) async {
    try {
      String fileContent = await rootBundle.loadString(userFilePath);
      Map<String, dynamic> jsonData = json.decode(fileContent);
      // print(jsonData);
      jsonData['data'].add(userData);

      final file = File(userFilePath);
      await file.writeAsString(json.encode(jsonData), mode: FileMode.write);
    } catch (e) {
      // print("Error saving user: $e");
    }
  }
}
