import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/Drawer/init_drawer_state.dart';
import 'package:todo_app/View/Drawer/mobile_drawer_widgets.dart';


class MobileDrawerPage extends StatelessWidget with MobileDrawerWidgets {
  final InitDrawer state;
  final WidgetRef ref;

  const MobileDrawerPage({
    Key? key ,
    required this.ref ,
    required this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //UserAccountsDrawerHeader() ,


          buildButtonTheme(context: context, ref: ref, state: state) ,

          const Divider() ,

          buildButtonLang(context: context, ref: ref, state: state),

        ],
      )
    );
  }
}