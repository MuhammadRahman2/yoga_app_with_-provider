import 'package:flutter/cupertino.dart';

class Providers with ChangeNotifier {
  int valIncrement = 0;

  int get getValueIncrement => valIncrement;

  void valueIncrement() {
    valIncrement++;
    notifyListeners();
  }
}
