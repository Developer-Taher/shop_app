import 'package:flutter/material.dart';

enum TestmvcModelStatus {
  Ended,
  Loading,
  Error
}

class TestmvcModel extends ChangeNotifier {
  TestmvcModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  TestmvcModelStatus get status => _status;

  TestmvcModel();

  TestmvcModel.instance() {
    //TODO Add code here
  }
  
  void getter() {
    _status = TestmvcModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = TestmvcModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
     _status = TestmvcModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = TestmvcModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = TestmvcModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = TestmvcModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = TestmvcModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = TestmvcModelStatus.Ended;
    notifyListeners();
  }
}