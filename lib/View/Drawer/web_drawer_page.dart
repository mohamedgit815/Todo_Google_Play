import 'package:flutter/material.dart';
import 'package:todo_app/View/Drawer/init_drawer_state.dart';
import 'package:todo_app/View/Drawer/web_drawer_widgets.dart';


class WebDrawerView extends StatelessWidget with WebDrawerWidgets {
  final InitDrawer init;

  const WebDrawerView({Key? key , required this.init}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
