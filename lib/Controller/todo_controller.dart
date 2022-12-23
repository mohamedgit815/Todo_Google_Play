import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';


class TodoController {

  /// To Create Item for Todo
  Future<void> createTodo({
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
      App.alert.customSnackBar(text: App.constance.createScreenError , context: context);
      return;
    }
    try {
      await Controller.dbHelper.createTodo(model);
      App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    } catch (e){
      App.alert.customSnackBar(text: App.constance.createScreenError , context: context);
    }

    //return await dbHelperController.createTodo(model);
    //  await dbHelperController.createTodo(model).then((value) {
    //   customSnackBar(text: App.constance.createScreenSuccess , context: context);
    //   return App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    // }).catchError((err) {
    //   return customSnackBar(text: App.constance.createScreenError , context: context);
    // } );
  }


  /// To Delete Item for Todo
  Future<void> deleteItem({
    required int id , required BuildContext context
  }) async {
    await  Controller.dbHelper.deleteTodo(id).then((value) {
      App.alert.customSnackBar(text: App.constance.homeScreenDeleted , context: context);
    }).catchError((err){
      App.alert.customSnackBar(text: err.toString() , context: context);
    });
  }


  /// To Update Item for Todo
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
      App.alert.customSnackBar(text: App.constance.updateError , context: context);
      return;
    }
    try {
      await Controller.dbHelper.updateTodo(todoModel: model , id: id );
      App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    } catch (e){
      App.alert.customSnackBar(text: App.constance.updateError , context: context);
    }
  }


}