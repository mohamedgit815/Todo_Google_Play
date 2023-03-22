import 'package:todo_app/App/Helper/localization_helper.dart';
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
  static final AppStrings strings = AppStrings(); /// AppStrings
  static final AppColor color = AppColor(); /// Colors
  static final RegularExpression regExp = RegularExpression(); /// RegularExpression

  /// Base
  static final BaseAppValidator validator = AppValidator(); /// Validator.
  static final BaseAppThemes theme = AppThemes(); /// Themes
  static final BaseAlertWidgets alertWidgets = AlertWidgets(); /// AlertWidgets
  static final BasePackagesWidgets packageWidgets = PackagesWidgets(); /// Packages Widgets
  static final BaseGlobalWidgets globalWidgets = GlobalWidgets(); /// GlobalWidgets
  static final BaseButtonsWidgets buttons = ButtonsWidgets(); /// Every Buttons
  static final BaseTextWidgets text = TextWidget(); /// Every Text Widgets
  static final BaseLocalizationHelper localization = LocalizationHelper();

}

