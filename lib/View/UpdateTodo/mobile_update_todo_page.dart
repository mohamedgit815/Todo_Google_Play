import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_widgets.dart';



class MobileUpdateTodoPage extends ConsumerStatefulWidget {
  final int id;
  final InitUpdateTodo update;
  final BaseTodoModel model;
  // final ProviderListenable<BooleanState> provUpdateTitleDirection , provUpdateContentDirection;
  // final TextEditingController titleController , contentController;
  // final BaseDBHelperController dbHelperController;

  const MobileUpdateTodoPage({
    Key? key ,
    required this.update ,
    required this.id ,
    required this.model ,
    // required this.titleController ,
    // required this.contentController ,
    // required this.dbHelperController ,
    // required this.provUpdateTitleDirection ,
    // required this.provUpdateContentDirection
  }) : super(key: key);

  @override
  ConsumerState<MobileUpdateTodoPage> createState() => _MobileUpdateTodoPageState();
}

class _MobileUpdateTodoPageState extends ConsumerState<MobileUpdateTodoPage>
with MobileUpdateTodoWidgets {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey<int>(widget.id) ,
      /// _MobileCreateTodoWidgets for FloatingActionButton
      floatingActionButton: floatingActionButton(
        key: widget.id ,
          onPress: () async {

            /// i Do that to check TextField Empty or No
            if(
                widget.update.main.titleController.text.isEmpty
                    &&
                widget.update.main.contentController.text.isEmpty
            ) {
              return await showDialog(
                  context: context ,
                  builder: (context)=> App.globalWidgets.globalAlertDialog(
                    title: App.strings.deleteDialog,
                  onPressForNo: () async {
                      return await App.navigator.backPageRouter(context: context);
                  },
                  onPressForYes: () async {
                    /// deleteItem used if TextField is Empty  path is: HomeController
                    //return await deleteItem(id: widget.id )
                    return await Controller.todo.deleteTodoController(id: widget.id , context: context)
                        .then((value) async {
                      /// navigatorHomeScreen is HomeController i used it to Navigator to HomeScreen.
                      Controller.navigator.navigatorHomeScreen(context);
                    });
                  }
              ));
            } else {
              if(
              widget.model.title == widget.update.main.titleController.text
                  &&
              widget.model.content == widget.update.main.contentController.text
              ) {
                return await App.navigator.backPageRouter(context: context);
              } else {
                /// updateTodoController used if TextField is not Empty path is: UpdateController
                return await Controller.todo.updateTodoController(
                    context: context ,
                    id: widget.id ,
                    title: widget.update.main.titleController.text ,
                    content: widget.update.main.contentController.text ,
                    checkTitleDirection: ref.read(widget.update.main.provUpdateTitleDirection).boolean ? 0 : 1 ,
                    checkContentDirection: ref.read(widget.update.main.provUpdateContentDirection).boolean ? 0 : 1
                );
              }
            }
          }
      ) ,

      /// _MobileCreateTodoWidgets for AppBar
      appBar: appBar(
          key: widget.id ,
          providerListenable: widget.update.main.provUpdateContentDirection ,
        model: widget.model
      ) ,


      body: LayoutBuilder(
        builder: (BuildContext context , BoxConstraints constraints) {
          return Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              titleTextField(
                  model: widget.model ,
                  providerListenable: widget.update.main.provUpdateTitleDirection ,
                  titleController: widget.update.main.titleController /// CreateTodoController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  key: ValueKey<int>(widget.id) ,
                  child: contentTextField(
                    model: widget.model ,
                      providerListenable: widget.update.main.provUpdateContentDirection ,
                      contentController: widget.update.main.contentController /// CreateTodoController
                  )
              ) ,


            ],
          );
        }
      ),
    );
  }

}

// /// This class to write all your Widgets
// class _MobileCrateTodoWidgets {
//
//   /// Appbar
//   AppBar _appBar({
//     required int key , required BaseTodoModel model ,
//     required ProviderListenable<BooleanState> providerListenable
//   }) {
//     //App.constance.appbarUpdateScreen
//     return AppBar(
//       key: ValueKey<int>(key),
//       title: CustomText(text: model.date.substring(0,19) , fontSize: 20.0) ,
//       centerTitle: true ,
//       actions: [
//         Consumer(
//             builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0) ,
//                 child: AnimatedConditional(
//                     state: prov.watch(providerListenable).boolean ,
//
//                     first: InkWell(
//                         onTap: () {
//                           /// To Change Direction for TextField
//                           prov.read(providerListenable).switchBoolean();
//                         } ,
//                         child: const Text("RTL")) ,
//
//                     second: InkWell(
//                         onTap: () {
//                           /// To Change Direction for TextField
//                           prov.read(providerListenable).switchBoolean();
//                         } ,
//                         child: const Text("LTR"))
//                 ),
//                 // child: App.conditional(
//                 //   condition: prov.watch(providerListenable).boolean ,
//                 //   builder: (BuildContext buildContext){
//                 //     return InkWell(
//                 //         onTap: () {
//                 //           /// To Change Direction for TextField
//                 //           prov.read(providerListenable).switchBoolean();
//                 //         } ,
//                 //         child: const Text("RTL"));
//                 //   } ,
//                 //   fallback: (BuildContext buildContext){
//                 //     return InkWell(
//                 //         onTap: () {
//                 //           /// To Change Direction for TextField
//                 //           prov.read(providerListenable).switchBoolean();
//                 //         },
//                 //         child: const Text("LTR"));
//                 //   } ,
//                 // ),
//               );
//             }
//         )
//       ],
//     );
//   }
//
//
//   /// Floating Action Button
//   _floatingActionButton({required VoidCallback onPress ,required int key}) {
//     return App.globalWidgets.globalFloatingActionButton(
//         key: ValueKey<int>(key) ,
//         onPress: onPress ,
//         child: const Icon(Icons.add)
//         );
//   }
//
//
//   /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
//   Consumer _titleTextField({
//     required TextEditingController titleController ,
//     required BaseTodoModel model ,
//     required ProviderListenable<BooleanState> providerListenable
//   }) {
//     return Consumer(
//       builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
//         return App.globalWidgets.globalTextField(
//             hintText: "Title" ,
//             maxLine: 1 ,
//             textInputAction: TextInputAction.next ,
//             controller: titleController ,
//             suffixIcon: IconButton(onPressed: (){
//               prov.read(providerListenable).switchBoolean();
//             }, icon: Icon(Icons.cached , color: App.color.darkMainColor,)),
//             textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl
//         );
//       }
//     );
//   }
//
//
//   /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
//   Consumer _contentTextField({
//     required TextEditingController contentController ,
//     required BaseTodoModel model ,
//     required ProviderListenable<BooleanState> providerListenable
//   }) {
//     return Consumer(
//       builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
//         return App.globalWidgets.globalTextField(
//             hintText: "Content" ,
//             maxLine: 999999999 ,
//             textInputAction: TextInputAction.unspecified ,
//             controller: contentController ,
//             textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl
//         );
//       }
//     );
//   }
//
//
// }