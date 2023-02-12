import 'package:todo_app/App/Helper/dio_helper.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/App/Helper/global_helper.dart';
import 'package:todo_app/App/Helper/localization_helper.dart';
import 'package:todo_app/Controller/navigator_controller.dart';
import 'package:todo_app/Controller/todo_controller.dart';

class Controller {
  /// Controller
  static final BaseDBHelperController dbHelper = DBHelperController();
  static final BaseTodoController todo = TodoController();
  static final BaseNavigatorController navigator = NavigatorController();

  /// Helper
  static final DioHelper dio = DioHelper();
  static final BaseGlobalHelper global = GlobalHelper();
  static final BaseLocalizationHelper localization = LocalizationHelper();
}