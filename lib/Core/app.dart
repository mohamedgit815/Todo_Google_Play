import 'package:todo_app/Core/Utils/alerts.dart';
import 'package:todo_app/Core/Utils/app_colors.dart';
import 'package:todo_app/Core/Utils/app_strings.dart';
import 'package:todo_app/Core/Utils/app_themes.dart';
import 'package:todo_app/Core/Utils/global_variable.dart';
import 'package:todo_app/Core/Utils/global_widgets.dart';
import 'package:todo_app/Core/Utils/navigator.dart';
import 'package:todo_app/Core/Utils/packages_widgets.dart';
import 'package:todo_app/Core/Utils/regular_expressions.dart';



class App {
  static final AppStrings strings = AppStrings(); /// AppStrings
  static final AppColor color = AppColor(); /// Colors
  static final GlobalVariable variable = GlobalVariable(); /// Global Variables
  static final RegularExpression regExp = RegularExpression(); /// RegularExpression

  /// Base
  static final BaseAppNavigator navigator = AppNavigator(); /// Navigator.
  static final BaseAppValidator validator = AppValidator(); /// Validator.
  static final BaseAppThemes theme = AppThemes(); /// Themes
  static final BaseAlertWidgets alertWidgets = AlertWidgets(); /// AlertWidgets
  static final BasePackagesWidgets packageWidgets = PackagesWidgets(); /// Packages Widgets
  static final BaseGlobalWidgets globalWidgets = GlobalWidgets(); /// GlobalWidgets
}

