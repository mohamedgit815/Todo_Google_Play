import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';


class WebCreateTodoPage extends StatefulWidget {
  final InitCreateTodo create;
  final TextEditingController titleController , contentController;
  final BaseDBHelperController dbHelperController;
  final ProviderListenable<BooleanState> provTitleDirection , provContentDirection;

  const WebCreateTodoPage({
    Key? key ,
    required this.create ,
    required this.titleController ,
    required this.contentController ,
    required this.dbHelperController ,
    required this.provTitleDirection ,
    required this.provContentDirection
  }) : super(key: key);

  @override
  State<WebCreateTodoPage> createState() => _WebCreateTodoPageState();
}

class _WebCreateTodoPageState extends State<WebCreateTodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
