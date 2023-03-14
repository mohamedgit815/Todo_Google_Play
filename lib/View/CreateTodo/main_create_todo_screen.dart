import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainCreateTodoScreen extends ConsumerStatefulWidget {

  const MainCreateTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainCreateTodoScreen> createState() => _MainCreateTodoScreenState();
}


class _MainCreateTodoScreenState extends ConsumerState<MainCreateTodoScreen> with RestorationMixin {

  late final InitCreateTodoState state;

  @override
  void initState() {
    super.initState();
    state = InitCreateTodoState();
    state.main.dbHelperController = state.controller.dbHelper;
  }

  @override
  void dispose() {
    super.dispose();
    state.main.titleController.value.dispose();
    state.main.contentController.value.dispose();
  }

  @override
  String? get restorationId => RestorationEnum.createTodoRestoration.name;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(state.main.titleController, RestorationEnum.createTitleRestorationId.name);
    registerForRestoration(state.main.contentController, RestorationEnum.createContentRestorationId.name);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        /// To Check Controller is empty or no
        return await state.main.willPopScope(
            context: context ,
            state: state ,
            ref: ref
        );
      } ,


      child: GestureDetector(
        onTap: () {
          /// GlobalController : To Hide Keyboard
          return state.controller.global.unFocusKeyBoard(context);
        } ,


        child: state.app.packageWidgets.responsiveBuilderScreen(
          mobile: MobileCreateTodoPage(
            state: state ,
              titleController: state.main.titleController.value ,
              contentController: state.main.contentController.value ,
             ref: ref ,
          ) ,

          tablet: null ,


          deskTop: null


        ),
      ),
    );

  }
}