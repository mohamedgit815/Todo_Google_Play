import 'package:todo_app/Core/Utils/app_colors.dart';
import 'package:todo_app/Core/Utils/app_strings.dart';
import 'package:todo_app/Core/Utils/app_themes.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/Utils/global_widgets.dart';
import 'package:todo_app/Core/Utils/navigator.dart';
import 'package:todo_app/Core/Utils/packages_widgets.dart';
import 'package:todo_app/Core/Utils/regular_expressions.dart';



class App {
  static final AppStrings strings = AppStrings(); /// AppStrings
  static final AppColor color = AppColor(); /// Colors
  static final AppNavigator navigator = AppNavigator(); /// Navigator.
  static final AppValidator validator = AppValidator(); /// Validator.
  static final AppThemes theme = AppThemes(); /// Themes
  static final AlertWidgets alertWidgets = AlertWidgets(); /// AlertWidgets
  static final RegularExpression regExp = RegularExpression(); /// RegularExpression
  static final PackagesWidgets packageWidgets = PackagesWidgets(); /// Packages Widgets
  static final GlobalWidgets globalWidgets = GlobalWidgets(); /// GlobalWidgets
}

