import 'package:flutter/material.dart';
import 'package:todo_app/Controller/create_todo_controller.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/app.dart';


class MobileCreateTodoPage extends StatefulWidget {
  final BoxConstraints constraints;
  const MobileCreateTodoPage({Key? key , required this.constraints}) : super(key: key);

  @override
  State<MobileCreateTodoPage> createState() => _MobileCreateTodoPageState();
}

class _MobileCreateTodoPageState extends State<MobileCreateTodoPage>
with _MobileCrateTodoWidgets , GlobalController
, CreateTodoController , RestorationMixin {

  @override
  void initState() {
    super.initState();
    dbHelperController = DBHelperController();
  }


  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
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
    return WillPopScope(
      onWillPop: () async {

        /// To Check Controller is empty or no
        if(titleController.value.text.isNotEmpty || contentController.value.text.isNotEmpty) {
         /// AlertDialog for WillPopScope
         return await showDialog(context: context , builder: (BuildContext buildContext) {
           return App.globalAlertDialog(
               title: App.constance.saveDialog ,
               onPressForNo: ()  {
                 navigatorHomeScreen(context);
               } ,
               onPressForYes: () async {
                 await createTodo(
                     context: context ,
                     title: titleController.value.text ,
                     content: contentController.value.text
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
          return unFocusKeyBoard(context);
        } ,
        child: Scaffold(

          /// _MobileCreateTodoWidgets for FloatingActionButton
          floatingActionButton: _floatingActionButton(
              onPress: () async {
                 await createTodo(
                  context: context ,
                  title: titleController.value.text ,
                  content: contentController.value.text
                );
              }
          ) ,

          /// _MobileCreateTodoWidgets for AppBar
          appBar: _appBar() ,


          body: Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              _titleTextField(
                  titleController: titleController.value /// CreateTodoController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  child: _contentTextField(
                      contentController: contentController.value /// CreateTodoController
                  )
              ) ,


            ],
          )
        ),
      ),
    );
  }




}

class _MobileCrateTodoWidgets {

  /// Appbar
  AppBar _appBar() {
    return AppBar(
      title: CustomText(text: App.constance.appbarCreateScreen , fontSize: 20.0) ,
      centerTitle: true ,
    );
  }


  /// Floating Action Button
   _floatingActionButton({required VoidCallback onPress}) {
    return App.globalFloatingActionButton(
        onPress: onPress ,
        child: const Icon(Icons.add)
        );
  }


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  _titleTextField({required TextEditingController titleController}) {
    return App.globalTextField(
        hintText: "Title" ,
        maxLine: 1 ,
        textInputAction: TextInputAction.next ,
        controller: titleController
    );
  }


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  _contentTextField({required TextEditingController contentController}) {
    return App.globalTextField(
        hintText: "Content" ,
        maxLine: 999999999 ,
        textInputAction: TextInputAction.unspecified ,
        controller: contentController
    );
  }

}