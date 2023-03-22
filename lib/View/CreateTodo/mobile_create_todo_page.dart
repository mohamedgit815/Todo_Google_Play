import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_widgets.dart';




class MobileCreateTodoPage extends StatelessWidget with MobileCrateTodoWidgets{
  final InitCreateTodoState state;
  final WidgetRef ref;
  final TextEditingController titleController , contentController;

  const MobileCreateTodoPage({
    Key? key ,
    required this.state ,
    required this.ref ,
    required this.titleController ,
    required this.contentController ,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /// _MobileCreateTodoWidgets for FloatingActionButton
      floatingActionButton: floatingActionButton(
          state: state ,
          onPress: () async {
            return await state.main.createTodo(
                context: context ,
                state: state ,
                ref: ref
            );
          }
      ) ,

      /// _MobileCreateTodoWidgets for AppBar
      appBar: appBar(
          providerListenable: state.main.provContentDirection ,
          context: context ,
          state: state
      ) ,


      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints) {
          return Column(
            children: [

              /// _MobileCreateTodoWidgets for _titleTextField
              titleTextField( /// CreateTodoController
                  providerListenable: state.main.provTitleDirection ,
                  titleController: titleController ,
                  state: state
              ) ,


              /// _MobileCreateTodoWidgets for _contentTextField
              Expanded(
                  child: contentTextField( /// CreateTodoController
                      contentController: contentController,
                      providerListenable: state.main.provContentDirection,
                      state: state
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
//     return App.globalglobalFloatingActionButton(
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
//         return App.globalglobalTextField(
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
//         return App.globalglobalTextField(
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