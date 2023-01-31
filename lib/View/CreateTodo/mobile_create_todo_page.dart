import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/View/widgets.dart';



class MobileCreateTodoPage extends ConsumerStatefulWidget {
  final TextEditingController titleController , contentController;
  final BaseDBHelperController dbHelperController;
  final ProviderListenable<BooleanState> provTitleDirection , provContentDirection;

  const MobileCreateTodoPage({
    Key? key ,
    required this.titleController ,
    required this.contentController ,
    required this.dbHelperController ,
    required this.provTitleDirection ,
    required this.provContentDirection
  }) : super(key: key);

  @override
  ConsumerState<MobileCreateTodoPage> createState() => _MobileCreateTodoPageState();
}


class _MobileCreateTodoPageState extends ConsumerState<MobileCreateTodoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// _MobileCreateTodoWidgets for FloatingActionButton
      floatingActionButton: Widgets.createTodoMobile.floatingActionButton(
          onPress: () async {
             await Controller.todo.createTodoController(
              context: context ,
              title: widget.titleController.text ,
              content: widget.contentController.text ,
               checkTitleDirection: ref.read(widget.provTitleDirection).boolean ? 0 : 1 ,
               checkContentDirection: ref.read(widget.provContentDirection).boolean ? 0 : 1 ,
             );
          }
      ) ,

      /// _MobileCreateTodoWidgets for AppBar
      appBar: Widgets.createTodoMobile.appBar(providerListenable: widget.provContentDirection,context: context) ,


      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints) {
          return Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              Widgets.createTodoMobile.titleTextField( /// CreateTodoController
                  providerListenable: widget.provTitleDirection ,
                  titleController: widget.titleController
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  child: Widgets.createTodoMobile.contentTextField( /// CreateTodoController
                      contentController: widget.contentController,
                      providerListenable: widget.provContentDirection
                  )
              ) ,


            ],
          );
        }
      )
    );
  }




}

//
// class _MobileCrateTodoWidgets {
//
//   /// Appbar
//   AppBar _appBar({required ProviderListenable<BooleanState> providerListenable , required BuildContext context}) {
//     return AppBar(
//       title: CustomText(
//         text: "${context.lang!.translate(LangEnum.createScreen.name)}",
//         //text: "${Controller.global.translate(context: context, name: 'createScreen')}" ,
//           fontSize: 20.0) ,
//       //title: CustomText(text: App.strings.appbarCreateScreen , fontSize: 20.0) ,
//       centerTitle: true ,
//       actions: [
//         Consumer(
//           builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0) ,
//               child: AnimatedConditional(
//                   state: prov.watch(providerListenable).boolean  ,
//                   first: InkWell(
//                       onTap: () {
//                         prov.read(providerListenable).switchBoolean();
//                       },
//                       child: const Text("RTL")) ,
//                   second: InkWell(
//                       onTap: () {
//                         prov.read(providerListenable).switchBoolean();
//                       },
//                       child: const Text("LTR"))
//               )
//               // child: AnimatedCrossFade(
//               //     condition: prov.watch(providerListenable).boolean ,
//               //     builder: (BuildContext buildContext){
//               //       return InkWell(
//               //           onTap: () {
//               //             prov.read(providerListenable).switchBoolean();
//               //           } ,
//               //           child: const Text("RTL"));
//               //     } ,
//               //     fallback: (BuildContext buildContext){
//               //       return InkWell(
//               //           onTap: () {
//               //             prov.read(providerListenable).switchBoolean();
//               //           },
//               //           child: const Text("LTR"));
//               //     } ,
//               // ),
//             );
//           }
//         )
//       ],
//     );
//   }
//
//
//   /// Floating Action Button
//    Widget _floatingActionButton({required VoidCallback onPress}) {
//     return App.globalWidgets.globalFloatingActionButton(
//         onPress: onPress ,
//         child: const Icon(Icons.add)
//         );
//   }
//
//
//   /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
//   Consumer _titleTextField({
//     required TextEditingController titleController ,
//     required ProviderListenable<BooleanState> providerListenable ,
//   }) {
//     return Consumer(
//       builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
//         return App.globalWidgets.globalTextField(
//             hintText: "Title" ,
//             maxLine: 1 ,
//             suffixIcon: IconButton(onPressed: (){
//               prov.read(providerListenable).switchBoolean();
//             }, icon: Icon(Icons.cached , color: App.color.darkMainColor,)),
//             textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl ,
//             textInputAction: TextInputAction.next ,
//             controller: titleController
//         );
//       }
//     );
//   }
//
//
//   /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
//   Consumer _contentTextField({
//     required TextEditingController contentController ,
//     required ProviderListenable<BooleanState> providerListenable
//   }) {
//     return Consumer(
//       builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
//         return App.globalWidgets.globalTextField(
//             hintText: "Content" ,
//             maxLine: 999999999 ,
//             textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl ,
//             textInputAction: TextInputAction.unspecified ,
//             controller: contentController
//         );
//       }
//     );
//   }
//
// }