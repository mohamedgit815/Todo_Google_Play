import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/View/Drawer/init_drawer_state.dart';
import 'package:todo_app/View/Drawer/mobile_drawer_page.dart';


class MainDrawerScreen extends ConsumerStatefulWidget  {
  const MainDrawerScreen ({Key? key}) : super(key: key);

  @override
  ConsumerState<MainDrawerScreen> createState() => _MainDrawerScreenState();
}

class _MainDrawerScreenState extends ConsumerState<MainDrawerScreen> {

  late InitDrawer state;


  @override
  void initState() {
    super.initState();
    state = InitDrawer();
  }


  @override
  Widget build(BuildContext context) {
    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileDrawerPage(state: state, ref: ref,) ,
        tablet: null ,
        deskTop: null
    );
  }
}
