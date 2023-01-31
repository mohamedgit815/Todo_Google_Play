import 'package:flutter/material.dart';
import 'package:todo_app/Core/GlobalWidget/global_alert_dialog.dart';
import 'package:todo_app/Core/GlobalWidget/global_floating_action_button.dart';
import 'package:todo_app/Core/GlobalWidget/global_text_field.dart';


abstract class BaseGlobalWidgets {
  /// Function App for Global Widgets
  // Global AlertDialog
  GlobalAlertDialog globalAlertDialog({
    required String title ,
    required VoidCallback onPressForNo ,
    required VoidCallback onPressForYes
  });

  // GlobalTextField
  GlobalTextField globalTextField({
    required String hintText ,
    required int maxLine ,
    required TextInputAction textInputAction ,
    required TextEditingController controller ,
    ValueChanged<String>? onChange ,
    ValueChanged<String>? onSubmitted ,
    TextDirection? textDirection ,
    Widget? suffixIcon
  });

  // Global Floating Action Button
  GlobalFloatingActionButton globalFloatingActionButton({
    required VoidCallback onPress , required Widget child , ValueKey? key
  });
}



class GlobalWidgets extends BaseGlobalWidgets {
  /// Function App for Global Widgets

  @override
  GlobalAlertDialog globalAlertDialog({
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
  @override
  GlobalTextField globalTextField({
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



   @override
  GlobalFloatingActionButton globalFloatingActionButton({
    required VoidCallback onPress , required Widget child , ValueKey? key
  }) {
    return GlobalFloatingActionButton(onPress: onPress , valueKey: key , child: child);
  }



}