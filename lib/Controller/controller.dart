import 'package:todo_app/App/Helper/dio_helper.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/App/Helper/global_helper.dart';
import 'package:todo_app/App/Helper/localization_helper.dart';
import 'package:todo_app/Controller/navigator_controller.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class Controller {
  /// Controller
  final BaseDBHelperController dbHelper = DBHelperController();
  final BaseTodoController todo = TodoController();
  final BaseNavigatorController navigator = NavigatorController();

  /// Helper
  final BaseDioHelper dio = DioHelper();
  final BaseGlobalHelper global = GlobalHelper();
  final BaseLocalizationHelper localization = LocalizationHelper();
}