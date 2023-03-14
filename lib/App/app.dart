import 'package:todo_app/App/Widgets/alerts_widgets.dart';
import 'package:todo_app/App/Utils/app_colors.dart';
import 'package:todo_app/App/Utils/app_strings.dart';
import 'package:todo_app/App/Utils/app_themes.dart';
import 'package:todo_app/App/Widgets/buttons_widgets.dart';
import 'package:todo_app/App/Widgets/global_widgets.dart';
import 'package:todo_app/App/Utils/navigator.dart';
import 'package:todo_app/App/Widgets/packages_widgets.dart';
import 'package:todo_app/App/Utils/regular_expressions.dart';
import 'package:todo_app/App/Widgets/text_widgets.dart';


class App {
  static final BaseAppNavigator navigator = AppNavigator(); /// Navigator.
  final AppStrings strings = AppStrings(); /// AppStrings
  final AppColor color = AppColor(); /// Colors
  final RegularExpression regExp = RegularExpression(); /// RegularExpression

  /// Base
  final BaseAppValidator validator = AppValidator(); /// Validator.
  final BaseAppThemes theme = AppThemes(); /// Themes
  final BaseAlertWidgets alertWidgets = AlertWidgets(); /// AlertWidgets
  final BasePackagesWidgets packageWidgets = PackagesWidgets(); /// Packages Widgets
  final BaseGlobalWidgets globalWidgets = GlobalWidgets(); /// GlobalWidgets
  final BaseButtonsWidgets buttons = ButtonsWidgets(); /// Every Buttons
  final BaseTextWidgets text = TextWidget(); /// Every Text Widgets

}

