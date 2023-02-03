import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/Utils/general.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';
import 'package:todo_app/View/CreateTodo/main_create_todo_state.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainCreateTodoScreen extends ConsumerStatefulWidget {

  const MainCreateTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainCreateTodoScreen> createState() => _MainCreateTodoScreenState();
}


class _MainCreateTodoScreenState extends ConsumerState<MainCreateTodoScreen>
    with MainCreateTodoState , RestorationMixin {

  late final InitCreateTodo create;

  @override
  void initState() {
    super.initState();
    create = InitCreateTodo();
    create.main.dbHelperController = Controller.dbHelper;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.value.dispose();
    contentController.value.dispose();
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => RestorationEnum.createTodoRestoration.name;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(titleController, RestorationEnum.createTitleRestorationId.name);
    registerForRestoration(contentController, RestorationEnum.createContentRestorationId.name);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        /// To Check Controller is empty or no
        if(titleController.value.text.isNotEmpty || contentController.value.text.isNotEmpty) {
          /// AlertDialog for WillPopScope
          return await showDialog(context: context , builder: (BuildContext buildContext) {
            return App.globalWidgets.globalAlertDialog(
                title: App.strings.saveDialog ,
                onPressForNo: ()  {
                  Controller.navigator.navigatorHomeScreen(context);
                } ,
                onPressForYes: () async {
                  await Controller.todo.createTodoController(
                    context: context ,
                    title: titleController.value.text ,
                    content: contentController.value.text ,
                    checkTitleDirection: ref.read(provTitleDirection).boolean ? 0 : 1 ,
                    checkContentDirection: ref.read(provContentDirection).boolean ? 0 : 1 ,
                  );
                }
            );
          });
        } else {
          return true;
        }

      },


      child: GestureDetector(
        onTap: () {
          /// GlobalController : To Hide Keyboard
          return Controller.global.unFocusKeyBoard(context);
        } ,


        child: App.packageWidgets.responsiveBuilderScreen(
          mobile: MobileCreateTodoPage(
            create: create ,
              titleController: titleController.value ,
              contentController: contentController.value ,
          ) ,
          deskTop: null ,
          tablet: null ,
        ),
      ),
    );

  }
}


