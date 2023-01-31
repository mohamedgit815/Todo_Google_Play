import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Controller/localization_controller.dart';
import 'package:todo_app/Controller/navigator_controller.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class Controller {
  static final BaseGlobalController global = GlobalController();
  static final BaseDBHelperController dbHelper = DBHelperController();
  static final BaseTodoController todo = TodoController();
  static final BaseNavigatorController navigator = NavigatorController();
  static final BaseLocalizationController localization = LocalizationController();
}