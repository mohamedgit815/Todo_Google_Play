import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';

class TabletHomeTodoPage extends StatefulWidget {
  final BaseDBHelperController dbHelperController;
  final ProviderListenable<BooleanState> notificationProv;
  final InitHomeTodo home;

  const TabletHomeTodoPage({
    Key? key ,
    required this.home ,
    required this.dbHelperController ,
    required this.notificationProv
  }) : super(key: key);

  @override
  State<TabletHomeTodoPage> createState() => _TabletHomeTodoPageState();
}

class _TabletHomeTodoPageState extends State<TabletHomeTodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
