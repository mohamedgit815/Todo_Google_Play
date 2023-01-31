import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/general.dart';


class GlobalAlertDialog extends StatelessWidget {
  final VoidCallback onPressForNo , onPressForYes;
  final String title;

  const GlobalAlertDialog({
    Key? key ,
    required this.onPressForNo,
    required this.title ,
    required this.onPressForYes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(text:title),
      actions: [

        CustomElevatedButton(
            onPressed: onPressForNo ,
            child: const CustomText(text: "No")) ,


        CustomElevatedButton(
            onPressed: onPressForYes ,
            child: const CustomText(text: "Yes")
        ) ,


      ],
    );
  }
}
