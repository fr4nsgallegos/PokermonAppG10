import 'package:flutter/material.dart';

class DogProvider extends ChangeNotifier {
  String _name = "nombre no definido";

  String get name => _name;

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }
}
