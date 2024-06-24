import 'package:departure/screen/Departure/modal/dohe_model.dart';
import 'package:flutter/material.dart';

class DoheProvider extends ChangeNotifier {
  List<DepartureModel> jsondata = [];

  void convert(List<dynamic> data) {
    jsondata = data.map((item) => DepartureModel.fromJson(item)).toList();
    notifyListeners();
  }
  DepartureModel getData(int index) {
    return jsondata[index];
  }
}