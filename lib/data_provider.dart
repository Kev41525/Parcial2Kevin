import 'package:parcial_2/data.dart';
import 'package:parcial_2/database_helper.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<Data> dataList = [];
  DatabaseHelper dbHelper = DatabaseHelper();
  DataProvider() {
    _loadDataFromDatabase();
  }
  Future<void> _loadDataFromDatabase() async {
    dataList = await dbHelper.getData();
    notifyListeners();
  }

  Future<void> add(Data data) async {
    await dbHelper.insertData(data);
    _loadDataFromDatabase();
  }
}
