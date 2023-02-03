import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';


class WebUpdateTodoPage extends StatefulWidget {
  final InitUpdateTodo update;
  final int id;
  final BaseTodoModel model;
  final ProviderListenable<BooleanState> provUpdateTitleDirection , provUpdateContentDirection;
  final TextEditingController titleController , contentController;
  final BaseDBHelperController dbHelperController;


  const WebUpdateTodoPage({
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
  State<WebUpdateTodoPage> createState() => _WebUpdateTodoPageState();
}

class _WebUpdateTodoPageState extends State<WebUpdateTodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
