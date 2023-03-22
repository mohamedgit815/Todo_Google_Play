import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/Drawer/main_drawer_screen.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';


abstract class BaseMainHomeTodoState {

  late BaseDBHelperController dbHelperController;

  final ProviderListenable<BooleanProvider> notificationProv = ChangeNotifierProvider<BooleanProvider>((ref) => BooleanProvider());


  /// This to Back
  Future<void> backScreen({required BuildContext context});

  /// To Navigator Update Screen
  String navigateToUpdateScreen({
  required InitHomeTodo state ,
  required BuildContext context ,
  required BaseTodoModel model ,
  required int id
  });

  /// This to Delete Item
  Future<void> deleteItem({
    required InitHomeTodo state ,
    required BuildContext context ,
    required int id
});

  MainDrawerScreen drawerScreen();

}


class MainHomeTodoState extends BaseMainHomeTodoState {

  @override
  Future<void> backScreen({required BuildContext context}) async {
    return await App.navigator.backPageRouter(context: context);
  }

  @override
  MainDrawerScreen drawerScreen() {
    return const MainDrawerScreen();
  }

  @override
  String navigateToUpdateScreen({
    required InitHomeTodo state ,
    required BuildContext context ,
    required BaseTodoModel model ,
    required int id
  }) {
    return state.controller.navigator.navigateToUpdateTodoScreen(
        context: context,
        arguments: [
          id ,
          model.title ,
          model.content ,
          model.date ,
          model.checkTitleDirection ,
          model.checkContentDirection
        ]);
  }


  @override
  Future<void> deleteItem({
    required InitHomeTodo state ,
    required BuildContext context ,
    required int id
  }) async {
    return await state.controller.todo.deleteTodoController(
        id: id ,
        context: context ,
        controller: state.controller ,
    );
  }



}