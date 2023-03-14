import 'package:flutter/material.dart';


class GlobalTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final ValueChanged<String>? onChange , onSubmitted;
  final TextDirection? textDirection;
  final Widget? suffixIcon;

  const GlobalTextField({
    Key? key ,
    this.onChange ,
    this.onSubmitted ,
    this.textDirection ,
    this.suffixIcon ,
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
      textDirection: textDirection ?? TextDirection.ltr,
      //maxLength: 100 ,
      maxLines: maxLine ,
      //cursorColor: App.color.cursorColor ,
      decoration: InputDecoration(
          hintText: hintText ,
        suffixIcon: suffixIcon
      ) ,
    );
  }
}
