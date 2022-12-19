import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';

class UpdateTodoController {
  /// Variable
  final provUpdateTitleDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final provUpdateContentDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  late DBHelperController dbHelperController;


  /// Update Items
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