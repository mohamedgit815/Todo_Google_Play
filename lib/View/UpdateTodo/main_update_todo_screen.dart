import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_page.dart';


class MainUpdateTodoScreen extends ConsumerStatefulWidget {
  final int id , checkTitleDirection , checkContentDirection;
  final String title , content , date;
  //final TodoModel model;


  const MainUpdateTodoScreen({
    Key? key ,
    required this.id ,
    required this.title ,
    required this.content ,
    required this.date ,
    required this.checkTitleDirection ,
    required this.checkContentDirection ,
   // required this.model ,

  }) : super(key: key);

  @override
  ConsumerState<MainUpdateTodoScreen> createState() => _MainUpdateTodoScreenState();
}

class _MainUpdateTodoScreenState extends ConsumerState<MainUpdateTodoScreen> {

  late final BaseTodoModel todoModel;
  late final InitUpdateTodoState state;


  @override
  void initState() {
    super.initState();

    state = InitUpdateTodoState();

    todoModel = TodoModel(
        checkTitleDirection: widget.checkTitleDirection ,
        checkContentDirection: widget.checkContentDirection ,
        title: widget.title ,
        content: widget.content ,
        date: widget.date
    );

    state.main.dbHelperController = state.controller.dbHelper;
    state.main.titleController.text = widget.title; /// To TextField Equal Data from DataBase
    state.main.contentController.text = widget.content; /// To TextField Equal Data from DataBase


    if(widget.checkTitleDirection == 0) {
      /// to Change TextField Direction for Title
      ref.read(state.main.provUpdateTitleDirection).boolean = true;
    } else {
      ref.read(state.main.provUpdateTitleDirection).boolean = false;
    }


    if(widget.checkContentDirection == 0) {
      /// to Change TextField Direction for Content
      ref.read(state.main.provUpdateContentDirection).boolean = true;
    } else {
      ref.read(state.main.provUpdateContentDirection).boolean = false;
    }


    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   titleController.value.text = widget.title;
    //   contentController.value.text = widget.content;
    // });

    //Future.delayed(Duration.zero , () {
    //   titleController.text = widget.todoModel.title;
    //   contentController.text = widget.todoModel.content;
    //});
  }


  @override
  void dispose() {
    super.dispose();
    state.main.titleController.dispose();
    state.main.contentController.dispose();
  }

  // @override
  // // TODO: implement restorationId
  // String? get restorationId => App.constance.updateTodoRestoration;
  //
  // @override
  // void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
  //   registerForRestoration(titleController, App.constance.updateTitleRestorationId);
  //   registerForRestoration(contentController, App.constance.updateContentRestorationId);
  // }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return await state.main.willPopScope(
            state: state ,
            context: context ,
            id: widget.id ,
            ref: ref ,
            title: widget.title ,
            content: widget.content
        );
      } ,
      child: GestureDetector(
        onTap: () {
          /// GlobalController : To Hide Keyboard
          return state.controller.global.unFocusKeyBoard(context);
        } ,


        child: App.packageWidgets.responsiveBuilderScreen(
          mobile: MobileUpdateTodoPage(
            state: state ,
              id: widget.id ,
              model: todoModel ,
              ref: ref ,
          ) ,

          tablet: null ,

          deskTop: null ,

        ),
      ),
    );
  }


}


