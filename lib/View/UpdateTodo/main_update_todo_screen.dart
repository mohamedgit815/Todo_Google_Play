import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/responsive_builder.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_page.dart';

class MainUpdateTodoScreen extends StatelessWidget {
  final int id;
  final TodoModel todoModel;

  const MainUpdateTodoScreen({
    Key? key ,
    required this.id ,
    required this.todoModel ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return ResponsiveBuilderScreen(
              mobile: MobileUpdateTodoPage(
                constraints: constraints ,
                id: id ,
                model: todoModel ,
              ) ,
              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}