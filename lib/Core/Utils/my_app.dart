import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/View/HomeTodo/main_home_todo_screen.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Todo App' ,

      restorationScopeId: 'root' ,

      navigatorKey: App.navigator.navigatorKey ,

      onGenerateRoute: RouteGenerators.onGenerate ,

      themeMode: ThemeMode.dark ,

      darkTheme: App.theme.darkThemeData() ,

      //home: const MainHomeTodoScreen(),

      //initialRoute: RouteGenerators.createScreen ,
      //initialRoute: RouteGenerators.homeScreen ,

      home: const MainHomeTodoScreen()
      //home: const TestPage()
    );
  }
}