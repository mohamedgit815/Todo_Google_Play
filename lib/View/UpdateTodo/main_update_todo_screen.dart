import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';
import 'package:todo_app/View/UpdateTodo/main_update_todo_state.dart';
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

class _MainUpdateTodoScreenState extends ConsumerState<MainUpdateTodoScreen>
with MainUpdateTodoState {

  late final BaseTodoModel todoModel;
  late final InitUpdateTodo update;


  @override
  void initState() {
    super.initState();

    update = InitUpdateTodo();



    todoModel = TodoModel(
        checkTitleDirection: widget.checkTitleDirection ,
        checkContentDirection: widget.checkContentDirection ,
        title: widget.title ,
        content: widget.content ,
        date: widget.date
    );

    update.main.dbHelperController = Controller.dbHelper;
    update.main.titleController.text = widget.title; /// To TextField Equal Data from DataBase
    update.main.contentController.text = widget.content; /// To TextField Equal Data from DataBase


    if(widget.checkTitleDirection == 0) {
      /// to Change TextField Direction for Title
      ref.read(provUpdateTitleDirection).boolean = true;
    } else {
      ref.read(provUpdateTitleDirection).boolean = false;
    }


    if(widget.checkContentDirection == 0) {
      /// to Change TextField Direction for Content
      ref.read(provUpdateContentDirection).boolean = true;
    } else {
      ref.read(provUpdateContentDirection).boolean = false;
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
    titleController.dispose();
    contentController.dispose();
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
        if(
        update.main.titleController.text.isEmpty && update.main.contentController.text.isEmpty
        ) {
          /// AlertDialog for WillPopScope
          return await showDialog(
              context: context,
              builder: (BuildContext context) => App.globalWidgets.globalAlertDialog(
                  title: App.strings.deleteDialog ,
                  onPressForNo: () {
                    /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                    Controller.navigator.navigatorHomeScreen(context);
                  } ,

                  onPressForYes: () async {
                    /// deleteItem used if TextField is Empty  path is: HomeController
                    //return await deleteItem(id: widget.id)
                    return await Controller.todo.deleteTodoController(id: widget.id , context: context)
                        .then((value) async {
                      /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                      Controller.navigator.navigatorHomeScreen(context);
                    });
                  }
              )
          );
        } else if (
        update.main.titleController.text.length != widget.title.length
            || /// To Check TextField is empty or no
            update.main.contentController.text.length != widget.content.length
        ) {
          /// AlertDialog for WillPopScope
          return await showDialog(
              context: context,
              builder: (BuildContext context) => App.globalWidgets.globalAlertDialog(
                  title: App.strings.saveDialog ,
                  onPressForNo: () async {
                    /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                    Controller.navigator.navigatorHomeScreen(context);
                  } ,

                  onPressForYes: () async {
                    /// updateTodoController used if TextField is not Empty path is: UpdateController
                    return await Controller.todo.updateTodoController(
                      context: context ,
                      id: widget.id ,
                      title: titleController.text ,
                      content: contentController.text,
                      checkTitleDirection: ref.read(provUpdateTitleDirection).boolean ? 0 : 1 ,
                      checkContentDirection: ref.read(provUpdateContentDirection).boolean ? 0 : 1 ,

                    );
                  }
              )
          );
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
          mobile: MobileUpdateTodoPage(
            update: update ,
              id: widget.id ,
              model: todoModel ,
              // titleController: titleController ,
              // contentController: contentController ,
              // dbHelperController: dbHelperController ,
              // provUpdateTitleDirection: provUpdateTitleDirection ,
              // provUpdateContentDirection: provUpdateContentDirection
          ) ,

          tablet: null ,

          deskTop: null ,

        ),
      ),
    );
  }


}


