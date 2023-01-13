import 'package:flutter/material.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';


class MainCreateTodoScreen extends ConsumerStatefulWidget {

  const MainCreateTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainCreateTodoScreen> createState() => _MainCreateTodoScreenState();
}


class _MainCreateTodoScreenState extends ConsumerState<MainCreateTodoScreen>
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
  String? get restorationId => App.strings.constance.createTodoRestoration;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(titleController, App.strings.constance.createTitleRestorationId);
    registerForRestoration(contentController, App.strings.constance.createContentRestorationId);
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
                title: App.strings.languages.saveDialog ,
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
              titleController: titleController.value ,
              contentController: contentController.value ,
              dbHelperController: dbHelperController ,
              provTitleDirection: provTitleDirection ,
              provContentDirection: provContentDirection
          ) ,
          deskTop: null ,
          tablet: null ,
        ),
      ),
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