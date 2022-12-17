import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/responsive_builder.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_page.dart';

class MainCreateTodoScreen extends StatelessWidget {

  const MainCreateTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return ResponsiveBuilderScreen(
              mobile: MobileCreateTodoPage(constraints: constraints) ,
              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}