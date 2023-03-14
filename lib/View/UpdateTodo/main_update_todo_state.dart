import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';


abstract class BaseMainUpdateTodoState {

  final ProviderListenable<BooleanState> provUpdateTitleDirection = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());

  final ProviderListenable<BooleanState> provUpdateContentDirection =ChangeNotifierProvider<BooleanState>((ref) => BooleanState());

  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  late BaseDBHelperController dbHelperController;

  Future<dynamic> backButton(BuildContext context);

  Future<bool> willPopScope({
    required InitUpdateTodoState state ,
    required BuildContext context ,
    required int id ,
    required WidgetRef ref ,
    required String title ,
    required String content ,
  });


  Future<void> updateItem({
    required InitUpdateTodoState state ,
    required BaseTodoModel model ,
    required BuildContext context ,
    required int id ,
    required WidgetRef ref
  });
}


class MainUpdateTodoState extends BaseMainUpdateTodoState {

  @override
  Future<bool> willPopScope({
    required InitUpdateTodoState state ,
    required BuildContext context ,
    required int id ,
    required WidgetRef ref ,
    required String title ,
    required String content ,
  }) async {
    if(
    state.main.titleController.text.isEmpty && state.main.contentController.text.isEmpty
    ) {
      /// AlertDialog for WillPopScope
      return await showDialog(
          context: context,
          builder: (BuildContext context) => state.app.globalWidgets.globalAlertDialog(
              title: state.app.strings.deleteDialog ,
              onPressForNo: () {
                /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                state.controller.navigator.navigatorHomeScreen(context);
              } ,

              onPressForYes: () async {
                /// deleteItem used if TextField is Empty  path is: HomeController
                //return await deleteItem(id: widget.id)
                return await state.controller.todo.deleteTodoController(
                  id: id ,
                  context: context ,
                  controller: state.controller ,
                  app: state.app ,
                )
                    .then((value) async {
                  /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                  state.controller.navigator.navigatorHomeScreen(context);
                });
              }
          )
      );
    } else if (
    state.main.titleController.text.length != title.length
        || /// To Check TextField is empty or no
        state.main.contentController.text.length != content.length
    ) {
      /// AlertDialog for WillPopScope
      return await showDialog(
          context: context,
          builder: (BuildContext context) => state.app.globalWidgets.globalAlertDialog(
              title: state.app.strings.saveDialog ,
              onPressForNo: () async {
                /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                state.controller.navigator.navigatorHomeScreen(context);
              } ,

              onPressForYes: () async {
                /// updateTodoController used if TextField is not Empty path is: UpdateController
                return await state.controller.todo.updateTodoController(
                  context: context ,
                  id: id ,
                  controller: state.controller ,
                  app: state.app ,
                  title: state.main.titleController.text ,
                  content: state.main.contentController.text,
                  checkTitleDirection: ref.read(state.main.provUpdateTitleDirection).boolean ? 0 : 1 ,
                  checkContentDirection: ref.read(state.main.provUpdateContentDirection).boolean ? 0 : 1 ,

                );
              }
          )
      );
    } else {
      return true;
    }
  }

  @override
  Future<dynamic> backButton(BuildContext context) async {
    return await App.navigator.backPageRouter(context: context);
  }

  @override
  Future<void> updateItem({
    required InitUpdateTodoState state ,
    required BaseTodoModel model ,
    required BuildContext context ,
    required int id ,
    required WidgetRef ref
  }) async {
    /// i Do that to check TextField Empty or No
    if(
    state.main.titleController.text.isEmpty
        &&
        state.main.contentController.text.isEmpty
    ) {
      return await showDialog(
          context: context ,
          builder: (context)=> state.app.globalWidgets.globalAlertDialog(
              title: state.app.strings.deleteDialog,
              onPressForNo: () async {
                return await App.navigator.backPageRouter(context: context);
              },
              onPressForYes: () async {
                /// deleteItem used if TextField is Empty  path is: HomeController
                //return await deleteItem(id: widget.id )
                return await state.controller.todo.deleteTodoController(
                  id: id ,
                  context: context ,
                  controller: state.controller ,
                  app: state.app ,
                )
                    .then((value) async {
                  /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                  state.controller.navigator.navigatorHomeScreen(context);
                });
              }
          ));
    } else {
      if(
      model.title == state.main.titleController.text
          &&
          model.content == state.main.contentController.text
      ) {
        return await App.navigator.backPageRouter(context: context);
      } else {
        /// updateTodoController used if TextField is not Empty path is: UpdateController
        return await state.controller.todo.updateTodoController(
            context: context ,
            id: id ,
            controller: state.controller ,
            app: state.app ,
            title: state.main.titleController.text ,
            content: state.main.contentController.text ,
            checkTitleDirection: ref.read(state.main.provUpdateTitleDirection).boolean ? 0 : 1 ,
            checkContentDirection: ref.read(state.main.provUpdateContentDirection).boolean ? 0 : 1
        );
      }
    }
  }
}