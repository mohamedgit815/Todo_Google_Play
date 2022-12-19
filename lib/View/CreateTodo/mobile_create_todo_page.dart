import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/create_todo_controller.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/app.dart';


class MobileCreateTodoPage extends ConsumerStatefulWidget {
  final BoxConstraints constraints;
  const MobileCreateTodoPage({Key? key , required this.constraints}) : super(key: key);

  @override
  ConsumerState<MobileCreateTodoPage> createState() => _MobileCreateTodoPageState();
}

class _MobileCreateTodoPageState extends ConsumerState<MobileCreateTodoPage>
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
          return unFocusKeyBoard(context);
        } ,
        child: Scaffold(

          /// _MobileCreateTodoWidgets for FloatingActionButton
          floatingActionButton: _floatingActionButton(
              onPress: () async {
                 await createTodo(
                  context: context ,
                  title: titleController.value.text ,
                  content: contentController.value.text ,
                   checkTitleDirection: ref.read(provTitleDirection).boolean ? 0 : 1 ,
                   checkContentDirection: ref.read(provContentDirection).boolean ? 0 : 1 ,
                 );
              }
          ) ,

          /// _MobileCreateTodoWidgets for AppBar
          appBar: _appBar(providerListenable: provContentDirection) ,


          body: Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              _titleTextField( /// CreateTodoController
                  providerListenable: provTitleDirection ,
                  titleController: titleController.value
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  child: _contentTextField( /// CreateTodoController
                      contentController: contentController.value,
                      providerListenable: provContentDirection
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
              child: App.conditional(
                  condition: prov.watch(providerListenable).boolean ,
                  builder: (BuildContext buildContext){
                    return InkWell(
                        onTap: () {
                          prov.read(providerListenable).switchBoolean();
                        } ,
                        child: const Text("RTL"));
                  } ,
                  fallback: (BuildContext buildContext){
                    return InkWell(
                        onTap: () {
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