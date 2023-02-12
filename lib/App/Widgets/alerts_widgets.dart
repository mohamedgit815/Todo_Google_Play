import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/general.dart';

abstract class BaseAlertWidgets {
  ScaffoldMessengerState customSnackBar({
    required String text,
    required BuildContext context ,
    final BorderRadius? borderRadius ,
    final EdgeInsets? padding ,
    final Duration? duration ,
    final SnackBarAction? snackBarAction
  });

  Future<void> customAlertDialog({
    required VoidCallback onPressed ,
    required BuildContext context
  });

  Future<void> customModalBottomSheet({
    required Widget widgets ,
    required BuildContext context
  });

  ScaffoldMessengerState customMaterialBanner({
    required BuildContext context ,
    required String text ,
    required List<Widget> actions ,
    Widget? leading
  });
}


class AlertWidgets implements BaseAlertWidgets {
  @override
  ScaffoldMessengerState customSnackBar({
    required String text,
    required BuildContext context ,
    final BorderRadius? borderRadius ,
    final EdgeInsets? padding ,
    final Duration? duration ,
    final SnackBarAction? snackBarAction
  }) {
    return ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
        SnackBar(
            content: CustomText(text: text),
            shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(0.0)),
            padding: padding ,
            duration: duration ?? const Duration(seconds: 1) ,
            action: snackBarAction
        ));
  }


  @override
  Future<void> customAlertDialog({
    required VoidCallback onPressed ,
    required BuildContext context
  }) {
    return showDialog(context: context, builder: (buildContext)=>AlertDialog(
      title: const CustomText(text: 'Sure'),
      //title: CustomText(text: '${context.translate!.translate(MainEnum.textSure.name)}'),
      actions: [
        CustomElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, child: const Text('No')),
        //child: Text('${context.translate!.translate(MainEnum.textNo.name)}')),
        CustomElevatedButton(
            onPressed: onPressed, child: const Text('Yes')),
      ],
    ));
  }


  @override
  Future<void> customModalBottomSheet({
    required Widget widgets ,
    required BuildContext context
  }) async {
    return await showModalBottomSheet(context: context, builder: (buildContext)=>widgets);
  }


  @override
  ScaffoldMessengerState customMaterialBanner({
    required BuildContext context ,
    required String text ,
    required List<Widget> actions ,
    Widget? leading
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(MaterialBanner(
          leading: leading ,
          content: Text(text) ,
          actions: actions
      ));
  }

}
