import 'package:figure_collections_maps/model/persons.dart';
import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  String _titleMaps = 'Figure Collections Maps';
  late String _titlePeoples = 'Registered Peoples';
  late String _titleChat = 'Chat';

  String get titleMaps => _titleMaps;

  listTitleMaps(){
    return _titleMaps;
  }

  listTitlePeoples(){
    return _titlePeoples;
  }

  listTitleChat(){
    return _titleChat;
  }

  void incrementEmail(String email) {
    _titleMaps = _titleMaps + email;
    notifyListeners();
  }
}
