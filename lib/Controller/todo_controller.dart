import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';

abstract class BaseTodoController {
  /// To Create Item for Todo
  Future<void> createTodoController({
    required BuildContext context ,
    required String title , required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection
  });

  /// To Delete Item for Todo
  Future<void> deleteTodoController({
    required int id , required BuildContext context
  });

  /// To Update Item for Todo
  Future<void> updateTodoController({
    required int id , required BuildContext context ,
    required String title , required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection
  });

}


class TodoController implements BaseTodoController {

  @override
  Future<void> createTodoController({
    required BuildContext context ,
    required String title , required String content ,
    required int checkTitleDirection ,
    required int checkContentDirection
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
      await Controller.dbHelper.createTodo(model);
      App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    } catch (e){
      App.alertWidgets.customSnackBar(text: App.strings.createScreenError , context: context);
    }

    //return await dbHelperController.createTodo(model);
    //  await dbHelperController.createTodo(model).then((value) {
    //   customSnackBar(text: App.constance.createScreenSuccess , context: context);
    //   return App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    // }).catchError((err) {
    //   return customSnackBar(text: App.constance.createScreenError , context: context);
    // } );
  }



  @override
  Future<void> deleteTodoController({
    required int id , required BuildContext context
  }) async {
    await  Controller.dbHelper.deleteTodo(id).then((value) {
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
    required int checkContentDirection
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
      await Controller.dbHelper.updateTodo(todoModel: model , id: id );
      App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    } catch (e){
      App.alertWidgets.customSnackBar(text: App.strings.updateError , context: context);
    }
  }

}