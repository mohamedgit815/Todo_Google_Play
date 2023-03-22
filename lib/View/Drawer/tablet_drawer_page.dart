import 'package:flutter/material.dart';
import 'package:todo_app/View/Drawer/init_drawer_state.dart';
import 'package:todo_app/View/Drawer/tablet_drawer_widgets.dart';



class TabletDrawerView extends StatelessWidget with TabletDrawerWidgets {
  final InitDrawer init;
  const TabletDrawerView({Key? key , required this.init}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
