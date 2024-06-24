
import 'package:flutter/material.dart';

class ShareProvider with ChangeNotifier {
  List<Data> data = [];

  List<Data> get shareData => data;

  void setData(List<Data> _data) {
    data = _data;
    notifyListeners();
  }
}

class Data {
  final String dohe;
  final String hindi;

  Data({required this.dohe, required this.hindi});
}
