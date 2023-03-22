import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/app.dart';


class GlobalAlertDialog extends StatelessWidget {
  final VoidCallback onPressForNo , onPressForYes;
  final String title;


  const GlobalAlertDialog({
    Key? key ,
    required this.onPressForNo,
    required this.title ,
    required this.onPressForYes ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(text:title),
      actions: [

        App.buttons.elevated(
            onPressed: onPressForNo ,
            child: const CustomText(text: "No")) ,


        App.buttons.elevated(
            onPressed: onPressForYes ,
            child: const CustomText(text: "Yes")
        ) ,


      ],
    );
  }
}
