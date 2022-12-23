import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';


class MainHomeTodoScreen extends StatefulWidget {

  const MainHomeTodoScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeTodoScreen> createState() => _MainHomeTodoScreenState();
}

class _MainHomeTodoScreenState extends State<MainHomeTodoScreen>
    with _MainHomeTodo {

  @override
  void initState() {
    super.initState();
    dbHelperController = Controller.dbHelper;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context , BoxConstraints constraints) {
            return App.responsiveBuilderScreen(
              mobile: MobileHomeTodoPage(
                constraints: constraints ,
                dbHelperController: dbHelperController ,
                notificationProv: notificationProv ,
              ) ,

              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}


class _MainHomeTodo {
  /// Variable
  final ProviderListenable<ProviderState> notificationProv = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  late DBHelperController dbHelperController;
}