import 'package:flutter/material.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';


class FetchDbController extends ChangeNotifier {
  final List data = [];

   Future<dynamic> getData() async {
     notifyListeners();
     final List<Map<String, dynamic>> db = await DBHelperController().fetchAllTodo();
     return data.addAll(db);
  }
}