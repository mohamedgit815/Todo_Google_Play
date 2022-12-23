import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Controller/navigator_controller.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class Controller {
  static final GlobalController global = GlobalController();
  static final DBHelperController dbHelper = DBHelperController();
  static final TodoController todo = TodoController();
  static final NavigatorController navigator = NavigatorController();
}