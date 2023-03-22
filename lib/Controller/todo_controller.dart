import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/route_builder.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/app_controller.dart';
import 'package:todo_app/Model/todo_model.dart';

abstract class BaseTodoController {

  /// To Create Item for Todo
  Future<void> createTodoController({
    required BuildContext context ,
    required String title , required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection ,
    required Controller controller
  });

  /// To Delete Item for Todo
  Future<void> deleteTodoController({
    required int id ,
    required BuildContext context ,
    required Controller controller
  });

  /// To Update Item for Todo
  Future<void> updateTodoController({
    required int id ,
    required BuildContext context ,
    required String title ,
    required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection ,
    required Controller controller
  });

}


class TodoController extends BaseTodoController {

  @override
  Future<void> createTodoController({
    required BuildContext context ,
    required String title , required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection ,
    required Controller controller
  }) async {
    final TodoModel model = TodoModel(
        title: title , content: content , date: DateTime.now().toString() ,
        checkTitleDirection: checkTitleDirection , checkContentDirection: checkContentDirection
    );

    if(title.isEmpty && content.isEmpty) {
      App.alertWidgets.customSnackBar(
          text: App.strings.createScreenError ,
          context: context);
      return;
    }
    try {
      await controller.dbHelper.createTodo(model);
      if(context.mounted) {
        App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
      }
    } catch (e){
      App.alertWidgets.customSnackBar(text: App.strings.createScreenError , context: context);
    }
  }



  @override
  Future<void> deleteTodoController({
    required int id ,
    required BuildContext context ,
    required Controller controller
  }) async {
    await  controller.dbHelper.deleteTodo(id).then((value) {
      App.alertWidgets.customSnackBar(text: App.strings.homeScreenDeleted , context: context);
    }).catchError((err){
      App.alertWidgets.customSnackBar(text: err.toString() , context: context);
    });
  }



  @override
  Future<void> updateTodoController({
    required int id , required BuildContext context ,
    required String title , required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection ,
    required Controller controller
  }) async {

    final TodoModel model = TodoModel(
        title: title , content: content , date: DateTime.now().toString() ,
        checkTitleDirection:  checkTitleDirection , checkContentDirection: checkContentDirection
    );
    if(title.isEmpty && content.isEmpty) {
      App.alertWidgets.customSnackBar(text: App.strings.updateError , context: context);
      return;
    }
    try {
      await controller.dbHelper.updateTodo(todoModel: model , id: id );
      if(context.mounted) {
        App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
      }
    } catch (e){
      App.alertWidgets.customSnackBar(text: App.strings.updateError , context: context);
    }
  }

}