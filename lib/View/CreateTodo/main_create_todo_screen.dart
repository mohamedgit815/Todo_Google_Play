import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';


class MainCreateTodoScreen extends StatefulWidget {

  const MainCreateTodoScreen({Key? key}) : super(key: key);

  @override
  State<MainCreateTodoScreen> createState() => _MainCreateTodoScreenState();
}


class _MainCreateTodoScreenState extends State<MainCreateTodoScreen>
    with _MainCreateTodo , RestorationMixin {

  @override
  void initState() {
    super.initState();
    dbHelperController = Controller.dbHelper;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.value.dispose();
    contentController.value.dispose();
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => App.constance.createTodoRestoration;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(titleController, App.constance.createTitleRestorationId);
    registerForRestoration(contentController, App.constance.createContentRestorationId);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return App.responsiveBuilderScreen(
              mobile: MobileCreateTodoPage(
                  constraints: constraints ,
                titleController: titleController.value ,
                contentController: contentController.value ,
                dbHelperController: dbHelperController ,
                provTitleDirection: provTitleDirection ,
                provContentDirection: provContentDirection ,
              ) ,
              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}


/// Variables
class _MainCreateTodo {
  final ProviderListenable<ProviderState> provTitleDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final ProviderListenable<ProviderState> provContentDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final RestorableTextEditingController titleController = RestorableTextEditingController();
  final RestorableTextEditingController contentController = RestorableTextEditingController();
  late DBHelperController dbHelperController;
}