import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';


abstract class BaseMainHomeTodoState {

  late BaseDBHelperController dbHelperController;

  final ProviderListenable<BooleanState> notificationProv = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());

  String navigateToUpdateScreen({
  required InitHomeTodoState state ,
  required BuildContext context ,
  required BaseTodoModel model ,
  required int id
  });
}


class MainHomeTodoState extends BaseMainHomeTodoState {

  @override
  String navigateToUpdateScreen({
    required InitHomeTodoState state ,
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
}