
import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier{
  double _value = 0;
  double get value => _value;

  void showDrawer(){
    _value == 0 ? _value = 1 : _value = 0;
    notifyListeners();
  }
}