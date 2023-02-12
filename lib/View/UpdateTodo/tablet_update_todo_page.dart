import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';

class TabletUpdateTodoPage extends StatefulWidget {
  final InitUpdateTodo update;
  final int id;
  final BaseTodoModel model;
  final ProviderListenable<BooleanState> provUpdateTitleDirection , provUpdateContentDirection;
  final TextEditingController titleController , contentController;
  final BaseDBHelperController dbHelperController;

  const TabletUpdateTodoPage({
    Key? key ,
    required this.update,
    required this.id,
    required this.model,
    required this.provUpdateTitleDirection,
    required this.provUpdateContentDirection,
    required this.titleController,
    required this.contentController,
    required this.dbHelperController
  }) : super(key: key);

  @override
  State<TabletUpdateTodoPage> createState() => _TabletUpdateTodoPageState();
}

class _TabletUpdateTodoPageState extends State<TabletUpdateTodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
