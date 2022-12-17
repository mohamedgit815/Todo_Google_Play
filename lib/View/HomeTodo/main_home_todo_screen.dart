import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/responsive_builder.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_page.dart';

class MainHomeTodoScreen extends StatelessWidget {

  const MainHomeTodoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return ResponsiveBuilderScreen(
              mobile: MobileHomeTodoPage(constraints: constraints) ,
              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}