import 'package:flutter/material.dart';

abstract class BaseModel with ChangeNotifier{


  // login olma için dinleme
  bool _busy=false;

  bool get busy => _busy;

  set busy(bool state) {
    _busy=state;

    notifyListeners();
  }

}