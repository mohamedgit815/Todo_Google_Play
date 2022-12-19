import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Controller/home_todo_controller.dart';
import 'package:todo_app/Controller/update_todo_controller.dart';
import 'package:todo_app/Core/GlobalWidget/global_alert_dialog.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';


class MobileUpdateTodoPage extends ConsumerStatefulWidget {
  final BoxConstraints constraints;
  final int id;
  final TodoModel model;
  const MobileUpdateTodoPage({
    Key? key ,
    required this.id ,
    required this.model ,
    required this.constraints ,
  }) : super(key: key);

  @override
  ConsumerState<MobileUpdateTodoPage> createState() => _MobileUpdateTodoPageState();
}

class _MobileUpdateTodoPageState extends ConsumerState<MobileUpdateTodoPage>
with _MobileCrateTodoWidgets , GlobalController , UpdateTodoController ,
    HomeTodoController  {


  @override
  void initState() {
    super.initState();
    dbHelperController = DBHelperController();
    titleController.text = widget.model.title; /// To TextField Equal Data from DataBase
    contentController.text = widget.model.content; /// To TextField Equal Data from DataBase


    if(widget.model.checkTitleDirection == 0) {
      /// to Change TextField Direction for Title
      ref.read(provUpdateTitleDirection).boolean = true;
    } else {
      ref.read(provUpdateTitleDirection).boolean = false;
    }


    if(widget.model.checkContentDirection == 0) {
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


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      key: ValueKey<int>(widget.id) ,
      onWillPop: () async {
        if(
        titleController.text.isEmpty && contentController.text.isEmpty
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
        titleController.text.length != widget.model.title.length
        || /// To Check TextField is empty or no
        contentController.text.length != widget.model.content.length
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
                if(titleController.text.isEmpty && contentController.text.isEmpty) {
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
                  widget.model.title == titleController.text
                      &&
                  widget.model.content == contentController.text
                  ) {
                    return await backOneScreen(context);
                  } else {
                    /// updateTodoController used if TextField is not Empty path is: UpdateController
                    return await updateTodoController(
                        context: context ,
                        id: widget.id ,
                        title: titleController.text ,
                        content: contentController.text ,
                        checkTitleDirection: ref.read(provUpdateTitleDirection).boolean ? 0 : 1 ,
                        checkContentDirection: ref.read(provUpdateContentDirection).boolean ? 0 : 1
                    );
                  }
                }
              }
          ) ,

          /// _MobileCreateTodoWidgets for AppBar
          appBar: _appBar(
              key: widget.id ,
              providerListenable: provUpdateContentDirection ,
            model: widget.model
          ) ,


          body: Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              _titleTextField(
                  model: widget.model ,
                  providerListenable: provUpdateTitleDirection ,
                  titleController: titleController /// CreateTodoController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  key: ValueKey<int>(widget.id) ,
                  child: _contentTextField(
                    model: widget.model ,
                      providerListenable: provUpdateContentDirection ,
                      contentController: contentController /// CreateTodoController
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
  AppBar _appBar({
    required int key , required TodoModel model ,
    required ProviderListenable<ProviderState> providerListenable
  }) {
    //App.constance.appbarUpdateScreen
    return AppBar(
      key: ValueKey<int>(key),
      title: CustomText(text: model.date.substring(0,19) , fontSize: 20.0) ,
      centerTitle: true ,
      actions: [
        Consumer(
            builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0) ,
                child: App.conditional(
                  condition: prov.watch(providerListenable).boolean ,
                  builder: (BuildContext buildContext){
                    return InkWell(
                        onTap: () {
                          /// To Change Direction for TextField
                          prov.read(providerListenable).switchBoolean();
                        } ,
                        child: const Text("RTL"));
                  } ,
                  fallback: (BuildContext buildContext){
                    return InkWell(
                        onTap: () {
                          /// To Change Direction for TextField
                          prov.read(providerListenable).switchBoolean();
                        },
                        child: const Text("LTR"));
                  } ,
                ),
              );
            }
        )
      ],
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
  Consumer _titleTextField({
    required TextEditingController titleController ,
    required TodoModel model ,
    required ProviderListenable<ProviderState> providerListenable
  }) {
    return Consumer(
      builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
        return App.globalTextField(
            hintText: "Title" ,
            maxLine: 1 ,
            textInputAction: TextInputAction.next ,
            controller: titleController ,
            suffixIcon: IconButton(onPressed: (){
              prov.read(providerListenable).switchBoolean();
            }, icon: Icon(Icons.cached , color: App.color.darkMainColor,)),
            textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl
        );
      }
    );
  }


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer _contentTextField({
    required TextEditingController contentController , required TodoModel model ,
    required ProviderListenable<ProviderState> providerListenable
  }) {
    return Consumer(
      builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
        return App.globalTextField(
            hintText: "Content" ,
            maxLine: 999999999 ,
            textInputAction: TextInputAction.unspecified ,
            controller: contentController ,
            textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl
        );
      }
    );
  }


}