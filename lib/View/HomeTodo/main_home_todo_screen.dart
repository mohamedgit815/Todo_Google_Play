import 'package:flutter/material.dart';
//import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class MainHomeTodoScreen extends ConsumerStatefulWidget {

  const MainHomeTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainHomeTodoScreen> createState() => _MainHomeTodoScreenState();
}


class _MainHomeTodoScreenState extends ConsumerState<MainHomeTodoScreen> {

  late final InitHomeTodoState state ;

  @override
  void initState() {
    super.initState();

    state = InitHomeTodoState();

    //state.main.notificationProv = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());
    state.main.dbHelperController = state.controller.dbHelper;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context , BoxConstraints constraints) {
            return NotificationListener(
              onNotification: (UserScrollNotification notification) {
                /// HomeTodoController notificationListener
                return state.controller.global.notificationListener(
                    notification: notification ,
                    ref: ref ,
                    providerListenable: state.main.notificationProv
                );
              },
              child: state.app.packageWidgets.responsiveBuilderScreen(
                mobile: MobileHomeTodoPage(
                  state: state
                ) ,

                deskTop: Scaffold(
                  appBar: AppBar(
                    title: const Text("DeskTop"),
                  ),
                ) ,

                tablet: Scaffold(
                  appBar: AppBar(
                    title: const Text("Tablet"),
                  ),
                ) ,
              ),
            );
          }
    );
  }
}


