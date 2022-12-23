import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/app.dart';


class MobileCreateTodoPage extends ConsumerStatefulWidget {
  final BoxConstraints constraints;
  final TextEditingController titleController , contentController;
  final DBHelperController dbHelperController;
  final ProviderListenable<ProviderState> provTitleDirection , provContentDirection;

  const MobileCreateTodoPage({
    Key? key ,
    required this.constraints ,
    required this.titleController ,
    required this.contentController ,
    required this.dbHelperController ,
    required this.provTitleDirection ,
    required this.provContentDirection
  }) : super(key: key);

  @override
  ConsumerState<MobileCreateTodoPage> createState() => _MobileCreateTodoPageState();
}

class _MobileCreateTodoPageState extends ConsumerState<MobileCreateTodoPage>
with _MobileCrateTodoWidgets {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        /// To Check Controller is empty or no
        if(widget.titleController.text.isNotEmpty || widget.contentController.text.isNotEmpty) {
         /// AlertDialog for WillPopScope
         return await showDialog(context: context , builder: (BuildContext buildContext) {
           return App.globalAlertDialog(
               title: App.constance.saveDialog ,
               onPressForNo: ()  {
                 Controller.navigator.navigatorHomeScreen(context);
               } ,
               onPressForYes: () async {
                 await Controller.todo.createTodo(
                   context: context ,
                   title: widget.titleController.text ,
                   content: widget.contentController.text ,
                   checkTitleDirection: ref.read(widget.provTitleDirection).boolean ? 0 : 1 ,
                   checkContentDirection: ref.read(widget.provContentDirection).boolean ? 0 : 1 ,
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
        child: Scaffold(

          /// _MobileCreateTodoWidgets for FloatingActionButton
          floatingActionButton: _floatingActionButton(
              onPress: () async {
                 await Controller.todo.createTodo(
                  context: context ,
                  title: widget.titleController.text ,
                  content: widget.contentController.text ,
                   checkTitleDirection: ref.read(widget.provTitleDirection).boolean ? 0 : 1 ,
                   checkContentDirection: ref.read(widget.provContentDirection).boolean ? 0 : 1 ,
                 );
              }
          ) ,

          /// _MobileCreateTodoWidgets for AppBar
          appBar: _appBar(providerListenable: widget.provContentDirection) ,


          body: Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              _titleTextField( /// CreateTodoController
                  providerListenable: widget.provTitleDirection ,
                  titleController: widget.titleController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  child: _contentTextField( /// CreateTodoController
                      contentController: widget.contentController,
                      providerListenable: widget.provContentDirection
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
  AppBar _appBar({required ProviderListenable<ProviderState> providerListenable}) {
    return AppBar(
      title: CustomText(text: App.constance.appbarCreateScreen , fontSize: 20.0) ,
      centerTitle: true ,
      actions: [
        Consumer(
          builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0) ,
              child: AnimatedConditional(
                  state: prov.watch(providerListenable).boolean  ,
                  first: InkWell(
                      onTap: () {
                        prov.read(providerListenable).switchBoolean();
                      },
                      child: const Text("RTL")) ,
                  second: InkWell(
                      onTap: () {
                        prov.read(providerListenable).switchBoolean();
                      },
                      child: const Text("LTR"))
              )
              // child: AnimatedCrossFade(
              //     condition: prov.watch(providerListenable).boolean ,
              //     builder: (BuildContext buildContext){
              //       return InkWell(
              //           onTap: () {
              //             prov.read(providerListenable).switchBoolean();
              //           } ,
              //           child: const Text("RTL"));
              //     } ,
              //     fallback: (BuildContext buildContext){
              //       return InkWell(
              //           onTap: () {
              //             prov.read(providerListenable).switchBoolean();
              //           },
              //           child: const Text("LTR"));
              //     } ,
              // ),
            );
          }
        )
      ],
    );
  }


  /// Floating Action Button
   Widget _floatingActionButton({required VoidCallback onPress}) {
    return App.globalFloatingActionButton(
        onPress: onPress ,
        child: const Icon(Icons.add)
        );
  }


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer _titleTextField({
    required TextEditingController titleController ,
    required ProviderListenable<ProviderState> providerListenable ,
  }) {
    return Consumer(
      builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
        return App.globalTextField(
            hintText: "Title" ,
            maxLine: 1 ,
            suffixIcon: IconButton(onPressed: (){
              prov.read(providerListenable).switchBoolean();
            }, icon: Icon(Icons.cached , color: App.color.darkMainColor,)),
            textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl ,
            textInputAction: TextInputAction.next ,
            controller: titleController
        );
      }
    );
  }


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer _contentTextField({
    required TextEditingController contentController ,
    required ProviderListenable<ProviderState> providerListenable
  }) {
    return Consumer(
      builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
        return App.globalTextField(
            hintText: "Content" ,
            maxLine: 999999999 ,
            textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl ,
            textInputAction: TextInputAction.unspecified ,
            controller: contentController
        );
      }
    );
  }

}