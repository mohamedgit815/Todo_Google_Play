import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';


class MainHomeTodoScreen extends ConsumerStatefulWidget {

  const MainHomeTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainHomeTodoScreen> createState() => _MainHomeTodoScreenState();
}

class _MainHomeTodoScreenState extends ConsumerState<MainHomeTodoScreen>
    with _MainHomeTodo {

  @override
  void initState() {
    super.initState();
    notificationProv = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());
    dbHelperController = Controller.dbHelper;
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
                  dbHelperController: dbHelperController ,
                  notificationProv: notificationProv ,
                ) ,

                deskTop: null ,

                tablet: null ,
              ),
            );
          }
    );
  }
}


class _MainHomeTodo {
  /// Variable
  late ProviderListenable<BooleanState> notificationProv ;
  late BaseDBHelperController dbHelperController;
}