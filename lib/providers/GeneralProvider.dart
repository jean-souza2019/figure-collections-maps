import 'package:figure_collections_maps/model/persons.dart';
import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  late String _coffe = 'teste string';
  List<Person> _persons = [
    Person(1, 'Jean', 10, 20, 10, [
      'a'
    ])
  ];

  listCoffe(){
    return _coffe;
  }

  listPersons(){
    return _persons;
  }

  void incrementCoffe(String ml) {
    _coffe = ml;
    notifyListeners();
  }
}
