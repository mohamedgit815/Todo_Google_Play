import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_page.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';



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
with _MainUpdateTodo {

  @override
  void initState() {
    super.initState();
    dbHelperController = Controller.dbHelper;
    titleController.text = widget.title; /// To TextField Equal Data from DataBase
    contentController.text = widget.content; /// To TextField Equal Data from DataBase


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
    final TodoModel todoModel = TodoModel(checkTitleDirection: widget.checkTitleDirection, checkContentDirection: widget.checkContentDirection, title: widget.title, content: widget.content, date: widget.date);

    return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {

            return App.responsiveBuilderScreen(

              mobile: MobileUpdateTodoPage(
                constraints: constraints ,
                id: widget.id ,
                model: todoModel ,
                titleController: titleController ,
                contentController: contentController ,
                dbHelperController: dbHelperController ,
                provUpdateTitleDirection: provUpdateTitleDirection ,
                provUpdateContentDirection: provUpdateContentDirection
              ) ,


              deskTop: null ,
              tablet: null ,
            );
          }
    );
  }
}

class _MainUpdateTodo {
  /// Variable
  final provUpdateTitleDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final provUpdateContentDirection = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  late DBHelperController dbHelperController;
}