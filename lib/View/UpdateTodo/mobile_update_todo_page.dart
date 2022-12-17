import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Controller/home_todo_controller.dart';
import 'package:todo_app/Controller/update_todo_controller.dart';
import 'package:todo_app/Core/GlobalWidget/global_alert_dialog.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/app.dart';


class MobileUpdateTodoPage extends StatefulWidget {
  final BoxConstraints constraints;
  final String title , content , dateTime;
  final int id;
  const MobileUpdateTodoPage({
    Key? key ,
    required this.id ,
    required this.constraints ,
    required this.title ,
    required this.content ,
    required this.dateTime
  }) : super(key: key);

  @override
  State<MobileUpdateTodoPage> createState() => _MobileUpdateTodoPageState();
}

class _MobileUpdateTodoPageState extends State<MobileUpdateTodoPage>
with _MobileCrateTodoWidgets , GlobalController , UpdateTodoController ,
    HomeTodoController , RestorationMixin {


  @override
  void initState() {
    super.initState();
    dbHelperController = DBHelperController();

    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   titleController.value.text = widget.title;
    //   contentController.value.text = widget.content;
    // });

    Future.delayed(Duration.zero , () {
      titleController.value.text = widget.title;
      contentController.value.text = widget.content;
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.value.dispose();
    contentController.value.dispose();
  }


  @override
  // TODO: implement restorationId
  String? get restorationId => App.constance.updateTodoRestoration;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(titleController , App.constance.updateTitleRestorationId);
    registerForRestoration(contentController , App.constance.updateContentRestorationId);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      key: ValueKey<int>(widget.id) ,
      onWillPop: () async {
        if(
        titleController.value.text.isEmpty && contentController.value.text.isEmpty
        ) {
         /// AlertDialog for WillPopScope
          return await showDialog(
              context: context,
              builder: (BuildContext context) => GlobalAlertDialog(
                title: App.constance.deleteDialog ,
                  onPressForNo: () {
                    /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                      navigatorHomeScreen(context);
                  } ,

                  onPressForYes: () async {
                   /// deleteItem used if TextField is Empty  path is: HomeController
                      //return await deleteItem(id: widget.id)
                      return await deleteItem(id: widget.id , context: context)
                          .then((value) async {
                        /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                         navigatorHomeScreen(context);
                      });
                  }
                  )
          );
        } else if (
        titleController.value.text.length != widget.title.length
        || /// To Check TextField is empty or no
        contentController.value.text.length != widget.content.length
        ) {
          /// AlertDialog for WillPopScope
          return await showDialog(
              context: context,
              builder: (BuildContext context) => GlobalAlertDialog(
                  title: App.constance.saveDialog ,
                  onPressForNo: () async {
                    /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                     navigatorHomeScreen(context);
                  } ,

                  onPressForYes: () async {
                      /// updateTodoController used if TextField is not Empty path is: UpdateController
                      return await updateTodoController(
                          context: context ,
                          id: widget.id ,
                          title: titleController.value.text ,
                          content: contentController.value.text
                      );
                  }
              )
          );
        } else {
          return true;
        }
      },


      child: GestureDetector(
        key: ValueKey<int>(widget.id) ,
        onTap: () {
          /// GlobalController : To Hide Keyboard
          return unFocusKeyBoard(context);
        } ,
        child: Scaffold(
          key: ValueKey<int>(widget.id) ,
          /// _MobileCreateTodoWidgets for FloatingActionButton
          floatingActionButton: _floatingActionButton(
            key: widget.id ,
              onPress: () async {

                /// i Do that to check TextField Empty or No
                if(titleController.value.text.isEmpty && contentController.value.text.isEmpty) {
                  return await showDialog(
                      context: context ,
                      builder: (context)=> GlobalAlertDialog(
                        title: App.constance.deleteDialog,
                      onPressForNo: () async {
                          return await backOneScreen(context);
                      },
                      onPressForYes: () async {
                        /// deleteItem used if TextField is Empty  path is: HomeController
                        //return await deleteItem(id: widget.id )
                        return await deleteItem(id: widget.id , context: context)
                            .then((value) async {
                          /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                           navigatorHomeScreen(context);
                        });
                      }
                  ));
                } else {
                  if(
                  widget.title == titleController.value.text
                      &&
                  widget.content == contentController.value.text
                  ) {
                    return await backOneScreen(context);
                  } else {
                    /// updateTodoController used if TextField is not Empty path is: UpdateController
                    return await updateTodoController(
                        context: context ,
                        id: widget.id ,
                        title: titleController.value.text ,
                        content: contentController.value.text
                    );
                  }
                }
              }
          ) ,

          /// _MobileCreateTodoWidgets for AppBar
          appBar: _appBar(key: widget.id ,) ,


          body: Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              _titleTextField(
                  titleController: titleController.value /// CreateTodoController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  key: ValueKey<int>(widget.id) ,
                  child: _contentTextField(
                      contentController: contentController.value /// CreateTodoController
                  )
              ) ,


            ],
          ),
        ),
      ),
    );
  }

}

/// This class to write all your Widgets
class _MobileCrateTodoWidgets {

  /// Appbar
  AppBar _appBar({required int key}) {
    return AppBar(
      key: ValueKey<int>(key),
      title: CustomText(text: App.constance.appbarUpdateScreen , fontSize: 20.0) ,
      centerTitle: true ,
    );
  }


  /// Floating Action Button
    _floatingActionButton({required VoidCallback onPress ,required int key}) {
    return App.globalFloatingActionButton(
        key: ValueKey<int>(key) ,
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
        controller: titleController ,
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