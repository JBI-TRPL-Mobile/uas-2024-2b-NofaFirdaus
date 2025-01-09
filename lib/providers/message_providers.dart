import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_project/models/message.dart';


class MessageProviders with ChangeNotifier {
  List<Message> messages = [];

  Future<void> fetchMessages() async {
    final String response = await rootBundle.loadString('assets/message.json');
    final Map<String, dynamic> data = json.decode(response);
    
    final List<Message> loadedMessages = [];
    for (var item in data['data']) {
      loadedMessages.add(Message.fromJson(item));
    }
    
    messages = loadedMessages;
    
    notifyListeners();
  }
  
}
