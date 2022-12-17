import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/responsive_builder.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_page.dart';

class MainUpdateTodoScreen extends StatelessWidget {
  final String title , content , dateTime;
  final int id;

  const MainUpdateTodoScreen({
    Key? key ,
    required this.id ,
    required this.title ,
    required this.content ,
    required this.dateTime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return ResponsiveBuilderScreen(
              mobile: MobileUpdateTodoPage(
                constraints: constraints ,
                id: id, title: title , content: content ,dateTime: dateTime ,
              ) ,
              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}