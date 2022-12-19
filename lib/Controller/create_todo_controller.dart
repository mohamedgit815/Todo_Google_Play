import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';

class CreateTodoController {
  /// Variable
  final provTitleDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final provContentDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final RestorableTextEditingController titleController = RestorableTextEditingController();
  final RestorableTextEditingController contentController = RestorableTextEditingController();
  late DBHelperController dbHelperController;


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
      customSnackBar(text: App.constance.createScreenError , context: context);
      return;
    }
    try {
      await dbHelperController.createTodo(model);
      App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
    } catch (e){
      customSnackBar(text: App.constance.createScreenError , context: context);
    }

     //return await dbHelperController.createTodo(model);
     //  await dbHelperController.createTodo(model).then((value) {
     //   customSnackBar(text: App.constance.createScreenSuccess , context: context);
     //   return App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
     // }).catchError((err) {
     //   return customSnackBar(text: App.constance.createScreenError , context: context);
     // } );
  }


}