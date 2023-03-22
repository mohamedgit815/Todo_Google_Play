import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';

/// Variables

abstract class BaseMainCreateTodoState {
  ProviderListenable<BooleanProvider> provTitleDirection = ChangeNotifierProvider<BooleanProvider>((ref) => BooleanProvider());

  ProviderListenable<BooleanProvider> provContentDirection = ChangeNotifierProvider<BooleanProvider>((ref) => BooleanProvider());

  RestorableTextEditingController titleController = RestorableTextEditingController();

  RestorableTextEditingController contentController = RestorableTextEditingController();

  late BaseDBHelperController dbHelperController;

  Future<bool> willPopScope({
    required BuildContext context ,
    required InitCreateTodoState state ,
    required WidgetRef ref
  });

  Future<void> createTodo({
    required BuildContext context ,
    required InitCreateTodoState state ,
    required WidgetRef ref
  });

  Future<dynamic> backButton(BuildContext context);
}


class MainCreateTodoState extends BaseMainCreateTodoState {

  @override
  Future<dynamic> backButton(BuildContext context) async {
    return await App.navigator.backPageRouter(context: context);
  }

  @override
  Future<bool> willPopScope({
    required BuildContext context,
    required InitCreateTodoState state,
    required WidgetRef ref
  }) async {
    if (state.main.titleController.value.text.isNotEmpty ||
        state.main.contentController.value.text.isNotEmpty) {
      /// AlertDialog for WillPopScope
      return await showDialog(
          context: context, builder: (BuildContext buildContext) {
        return App.globalWidgets.globalAlertDialog(
            title: App.strings.saveDialog,
            onPressForNo: () {
              state.controller.navigator.navigatorHomeScreen(context);
            },
            onPressForYes: () async {
              await state.controller.todo.createTodoController(
                  context: context,
                  title: titleController.value.text,
                  content: contentController.value.text,
                  checkTitleDirection: ref
                      .read(provTitleDirection)
                      .boolean ? 0 : 1,
                  checkContentDirection: ref
                      .read(provContentDirection)
                      .boolean ? 0 : 1,
                  controller: state.controller,
              );
            }
        );
      });
    } else {
      return true;
    }
  }


  @override
  Future<void> createTodo({
    required BuildContext context,
    required InitCreateTodoState state,
    required WidgetRef ref
  }) async {
    await state.controller.todo.createTodoController(
      context: context,
      controller: state.controller,
      title: titleController.value.text,
      content: contentController.value.text,
      checkTitleDirection: ref
          .read(state.main.provTitleDirection)
          .boolean ? 0 : 1,
      checkContentDirection: ref
          .read(state.main.provContentDirection)
          .boolean ? 0 : 1,
    );
  }

}