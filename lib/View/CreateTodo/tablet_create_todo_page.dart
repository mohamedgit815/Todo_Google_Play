import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';

class TabletCreateTodoPage extends StatefulWidget {
  final InitCreateTodo create;
  final TextEditingController titleController , contentController;
  final BaseDBHelperController dbHelperController;
  final ProviderListenable<BooleanState> provTitleDirection , provContentDirection;

  const TabletCreateTodoPage({
    Key? key ,
    required this.create ,
    required this.titleController ,
    required this.contentController ,
    required this.dbHelperController ,
    required this.provTitleDirection ,
    required this.provContentDirection
  }) : super(key: key);

  @override
  State<TabletCreateTodoPage> createState() => _TabletCreateTodoPageState();
}

class _TabletCreateTodoPageState extends State<TabletCreateTodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
