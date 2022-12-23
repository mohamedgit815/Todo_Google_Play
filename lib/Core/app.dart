import 'package:flutter/material.dart';
import 'package:todo_app/Core/GlobalWidget/global_alert_dialog.dart';
import 'package:todo_app/Core/GlobalWidget/global_floating_action_button.dart';
import 'package:todo_app/Core/GlobalWidget/global_text_field.dart';
import 'package:todo_app/Core/Utils/app_colors.dart';
import 'package:todo_app/Core/Utils/app_constance.dart';
import 'package:todo_app/Core/Utils/app_functions.dart';
import 'package:todo_app/Core/Utils/app_themes.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/Utils/navigator.dart';
import 'package:todo_app/Core/Utils/regular_expressions.dart';
import 'package:todo_app/Core/Utils/responsive_builder.dart';


class App {
  static final AppConstance constance = AppConstance(); /// Every Things be String
  static final AppColor color = AppColor(); /// Colors
  static final AppNavigator navigator = AppNavigator(); /// Navigator.
  static final AppValidator validator = AppValidator(); /// Validator.
  static final AppGeneral general = AppGeneral(); /// General Function.
  static final AppThemes theme = AppThemes();
  static final CustomWidgets alert = CustomWidgets();
  static final RegularExpression regExp = RegularExpression();




  /// Function App for Packages

  // Package ResponsiveBuilder
  static ResponsiveBuilderScreen responsiveBuilderScreen({
    required Widget mobile ,
    Widget? tablet ,
    Widget? deskTop
  }) {
    return ResponsiveBuilderScreen(
      mobile: mobile ,
      tablet: tablet ?? mobile ,
      deskTop:deskTop ?? mobile ,
    );
  }




  /// Function App for Global Widgets
  // Global AlertDialog
  static GlobalAlertDialog globalAlertDialog({
    required String title ,
    required VoidCallback onPressForNo ,
    required VoidCallback onPressForYes
  }) {
    return GlobalAlertDialog(
        onPressForNo: onPressForNo,
        title: title ,
        onPressForYes: onPressForYes
    );
  }

  // GlobalTextField
  static GlobalTextField globalTextField({
    required String hintText ,
    required int maxLine ,
    required TextInputAction textInputAction ,
    required TextEditingController controller ,
    ValueChanged<String>? onChange ,
    ValueChanged<String>? onSubmitted ,
    TextDirection? textDirection ,
    Widget? suffixIcon
  }) {
    return GlobalTextField(
      hintText: hintText ,
      maxLine: maxLine ,
      textInputAction: textInputAction ,
      controller: controller ,
      onChange: onChange ,
      onSubmitted: onSubmitted ,
      suffixIcon: suffixIcon ,
      textDirection: textDirection
    );
  }

  // Global Floating Action Button
  static GlobalFloatingActionButton globalFloatingActionButton({
    required VoidCallback onPress , required Widget child , ValueKey? key
}){
    return GlobalFloatingActionButton(onPress: onPress , valueKey: key , child: child);
  }

}