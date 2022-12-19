import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Core/GlobalWidget/global_alert_dialog.dart';
import 'package:todo_app/Core/GlobalWidget/global_floating_action_button.dart';
import 'package:todo_app/Core/GlobalWidget/global_text_field.dart';
import 'package:todo_app/Core/Utils/app_colors.dart';
import 'package:todo_app/Core/Utils/app_constance.dart';
import 'package:todo_app/Core/Utils/app_functions.dart';
import 'package:todo_app/Core/Utils/app_themes.dart';
import 'package:todo_app/Core/Utils/navigator.dart';


class App {

  static final AppConstance constance = AppConstance(); /// Every Things be String
  static final AppColor color = AppColor(); /// Colors
  static final AppNavigator navigator = AppNavigator(); /// Navigator.
  static final AppValidator validator = AppValidator(); /// Validator.
  static final AppGeneral general = AppGeneral(); /// General Function.
  static final AppThemes theme = AppThemes();


  /// Global Widgets TextFormField Path is {Core/GlobalWidget/global_text_field.dart}
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

  /// Package AnimatedConditionalBuilder
  static AnimatedConditionalBuilder conditional({
      required bool condition ,
      required WidgetBuilder builder ,
      required WidgetBuilder? fallback
    }) {
      return AnimatedConditionalBuilder(
          condition: condition,
          builder: builder,
          fallback: fallback
      );
    }

}