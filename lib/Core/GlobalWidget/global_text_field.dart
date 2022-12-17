import 'package:flutter/material.dart';
import 'package:todo_app/Core/app.dart';


class GlobalTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final ValueChanged<String>? onChange , onSubmitted;

  const GlobalTextField({
    Key? key ,
    this.onChange ,
    this.onSubmitted ,
    required this.controller ,
    required this.hintText ,
    required this.maxLine ,
    required this.textInputAction
  }) : super(key: key);

  @override
  TextField build(BuildContext context) {

    return TextField(
      controller: controller ,
      textInputAction: textInputAction,
      keyboardType: TextInputType.text ,
      onChanged: onChange ,
      onSubmitted: onSubmitted ,
      autofocus: false ,
      autocorrect: true ,
      obscureText: false ,
      //maxLength: 100 ,
      maxLines: maxLine ,
      cursorColor: App.color.cursorColor ,
      decoration: InputDecoration(
          hintText: hintText ,
      ) ,
    );
  }
}
