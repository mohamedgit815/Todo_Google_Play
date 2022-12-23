import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/View/CreateTodo/main_create_todo_screen.dart';
import 'package:todo_app/View/HomeTodo/main_home_todo_screen.dart';
import 'package:todo_app/View/UpdateTodo/main_update_todo_screen.dart';


class RouteGenerators {

  static const String homeScreen = '/HomeTodoScreen';
  static const String createScreen = '/CreateTodoScreen';
  static const String updateTodoScreen = '/UpdateTodoScreen';


  static MaterialPageRoute<dynamic> _materialPageRoute(Widget page) {
    return MaterialPageRoute( builder: ( _ ) => page );
  }

  static CupertinoPageRoute<dynamic> _cupertinoPageRoute(Widget page) {
    return CupertinoPageRoute( builder: ( _ ) => page );
  }


  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch(settings.name) {

      case homeScreen : return _materialPageRoute(const MainHomeTodoScreen());

      case createScreen : return _cupertinoPageRoute(const MainCreateTodoScreen());

      case updateTodoScreen :
        final List data = settings.arguments as List;
        return _cupertinoPageRoute(MainUpdateTodoScreen(
            id: data.elementAt(0),
            title: data.elementAt(1) ,
            content: data.elementAt(2) ,
            date: data.elementAt(3) ,
            checkTitleDirection: data.elementAt(4) ,
            checkContentDirection: data.elementAt(5) ,
            //model: data.elementAt(6),
            //todoModel: data.elementAt(1),
        ));

    }
    return null;
  }


}