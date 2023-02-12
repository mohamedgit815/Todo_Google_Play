import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';
import 'package:todo_app/View/HomeTodo/main_home_todo_state.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class MainHomeTodoScreen extends ConsumerStatefulWidget {

  const MainHomeTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainHomeTodoScreen> createState() => _MainHomeTodoScreenState();
}


class _MainHomeTodoScreenState extends ConsumerState<MainHomeTodoScreen>
    with MainHomeTodoState {

  late final InitHomeTodo home ;

  @override
  void initState() {
    super.initState();

    home = InitHomeTodo();

    home.main.notificationProv = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());
    home.main.dbHelperController = Controller.dbHelper;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context , BoxConstraints constraints) {
            return NotificationListener(
              onNotification: (UserScrollNotification notification) {
                /// HomeTodoController notificationListener
                return Controller.global.notificationListener(
                    notification: notification ,
                    ref: ref ,
                    providerListenable: notificationProv
                );
              },
              child: App.packageWidgets.responsiveBuilderScreen(
                mobile: MobileHomeTodoPage(
                  home: home ,
                  // dbHelperController: dbHelperController ,
                  // notificationProv: notificationProv ,
                ) ,

                deskTop: null ,

                tablet: null ,
              ),
            );
          }
    );
  }
}


