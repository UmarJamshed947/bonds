import 'package:flutter/material.dart';
import '../Models/Draw_Date.dart';
import 'ApiService.dart';

// class DateProvider extends ChangeNotifier {
//   List<DrawDate> _drawDate = [];
//   List<DrawDate> get drawDate => _drawDate;
//
//   Future<void> fetchDrawDates(String drawUid) async {
//     ApiService apiService = ApiService();
//     _drawDate = await apiService.fetchDrawDateData(drawUid);
//     notifyListeners();
//   }
// }



class DrawDateProvider extends ChangeNotifier {
  List<DrawDate> _drawdate = [];

  List<DrawDate> get drawdate => _drawdate;

  Future<void> fetchData(String drawUid) async {
    _drawdate = await ApiService().fetchDrawDateData(drawUid);
    notifyListeners();
  }
}