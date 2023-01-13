import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';


class NavigatorController {
  /// Back Screen
  Future<dynamic> backOneScreen(BuildContext context) async {
    return await App.navigator.backPageRouter(context: context);
  }

  /// Navigator To HomeScreen
  String navigatorHomeScreen(BuildContext context) {
    return App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
  }

  /// Navigator to UpdateTodoScreen
  String navigateToUpdateTodoScreen({required BuildContext context , required List<dynamic> arguments}) {
    return App.navigator.pushNamedRouter(route: RouteGenerators.updateTodoScreen, context: context , arguments: arguments);
  }

  /// Navigator to Create TodoScreen
  String navigateToCreateTodoScreen(BuildContext context)  {
    return App.navigator.pushNamedRouter(route: RouteGenerators.createScreen, context: context);
  }
}