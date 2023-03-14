import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_widgets.dart';
import 'package:todo_app/App/app.dart';



class MobileUpdateTodoPage extends StatelessWidget with MobileUpdateTodoWidgets{
  final int id;
  final InitUpdateTodoState state;
  final BaseTodoModel model;
  final WidgetRef ref;
  final App app;

  const MobileUpdateTodoPage({
    Key? key ,
    required this.app ,
    required this.state ,
    required this.id ,
    required this.model ,
    required this.ref
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey<int>(id) ,
      /// _MobileCreateTodoWidgets for FloatingActionButton
      floatingActionButton: floatingActionButton(
        state: state ,
        key: id ,
          onPress: () async {
          return await state.main.updateItem(
              state: state ,
              model: model ,
              context: context ,
              id: id ,
              ref: ref
          );
        }
      ) ,

      /// _MobileCreateTodoWidgets for AppBar
      appBar: appBar(
          key: id ,
          state: state ,
          providerListenable: state.main.provUpdateContentDirection ,
        model: model ,
        onPressIcon: () {
            state.main.backButton(context);
        }
      ) ,


      body: LayoutBuilder(
        builder: (BuildContext context , BoxConstraints constraints) {
          return Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              titleTextField(
                state: state ,
                  model: model ,
                  providerListenable: state.main.provUpdateTitleDirection ,
                  titleController: state.main.titleController /// CreateTodoController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  key: ValueKey<int>(id) ,
                  child: contentTextField(
                    state: state ,
                    model: model ,
                      providerListenable: state.main.provUpdateContentDirection ,
                      contentController: state.main.contentController /// CreateTodoController
                  )
              ) ,


            ],
          );
        }
      ),
    );
  }

}