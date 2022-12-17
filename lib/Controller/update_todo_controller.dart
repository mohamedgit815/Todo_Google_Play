import 'package:flutter/material.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';

class UpdateTodoController {
  /// Variable
  final RestorableTextEditingController titleController = RestorableTextEditingController();
  final RestorableTextEditingController contentController = RestorableTextEditingController();
   late DBHelperController dbHelperController;


  /// Update Items
  Future<void> updateTodoController({
    required int id , required BuildContext context ,
    required String title , required String content
  }) async {

    final TodoModel model = TodoModel(title: title , content: content , date: DateTime.now().toString());
    if(title.isEmpty && content.isEmpty) {
      customSnackBar(text: App.constance.updateError , context: context);
      return;
    }
    try {
      await dbHelperController.updateTodo(todoModel: model , id: id );
      App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    } catch (e){
      customSnackBar(text: App.constance.updateError , context: context);
    }
  }



}