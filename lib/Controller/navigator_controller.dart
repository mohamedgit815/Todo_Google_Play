import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/route_builder.dart';
import 'package:todo_app/App/app.dart';


abstract class BaseNavigatorController {
  /// Navigator To HomeScreen
  String navigatorHomeScreen(BuildContext context);

  /// Navigator to UpdateTodoScreen
  String navigateToUpdateTodoScreen({required BuildContext context , required List<dynamic> arguments});

  /// Navigator to Create TodoScreen
  String navigateToCreateTodoScreen(BuildContext context);
}


class NavigatorController implements BaseNavigatorController {

  @override
  String navigatorHomeScreen(BuildContext context) {
    return App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
  }

  @override
  String navigateToUpdateTodoScreen({required BuildContext context , required List<dynamic> arguments}) {
    return App.navigator.pushNamedRouter(route: RouteGenerators.updateTodoScreen, context: context , arguments: arguments);
  }

  @override
  String navigateToCreateTodoScreen(BuildContext context)  {
    return App.navigator.pushNamedRouter(route: RouteGenerators.createScreen, context: context);
  }
}