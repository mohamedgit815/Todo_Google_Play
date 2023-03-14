import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/View/CreateTodo/init_create.dart';


abstract class BaseMobileCrateTodoWidgets {
  /// Appbar
  AppBar appBar({required ProviderListenable<BooleanState> providerListenable , required BuildContext context});


  /// Floating Action Button
  Widget floatingActionButton({required VoidCallback onPress , required InitCreateTodoState state});


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer titleTextField({
    required TextEditingController titleController ,
    required ProviderListenable<BooleanState> providerListenable ,
    required InitCreateTodoState state
  });


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer contentTextField({
    required TextEditingController contentController ,
    required ProviderListenable<BooleanState> providerListenable ,
    required InitCreateTodoState state
  });
}


class MobileCrateTodoWidgets implements BaseMobileCrateTodoWidgets {

  @override
  AppBar appBar({required ProviderListenable<BooleanState> providerListenable , required BuildContext context}) {
    return AppBar(
      title: CustomText(
          text: "${context.lang!.translate(LangEnum.createScreen.name)}",
          //text: "${Controller.global.translate(context: context, name: 'createScreen')}" ,
          fontSize: 20.0) ,
      //title: CustomText(text: App.strings.appbarCreateScreen , fontSize: 20.0) ,
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
              );
            }
        )
      ],
    );
  }


  @override
  Widget floatingActionButton({required VoidCallback onPress , required InitCreateTodoState state}) {
    return state.app.globalWidgets.globalFloatingActionButton(
        onPress: onPress ,
        child: const Icon(Icons.add)
    );
  }


  @override
  Consumer titleTextField({
    required TextEditingController titleController ,
    required ProviderListenable<BooleanState> providerListenable ,
    required InitCreateTodoState state
  }) {
    return Consumer(
        builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
          return state.app.globalWidgets.globalTextField(
              hintText: "Title" ,
              maxLine: 1 ,
              suffixIcon: IconButton(onPressed: (){
                prov.read(providerListenable).switchBoolean();
              }, icon: Icon(Icons.cached , color: state.app.color.darkMainColor,)),
              textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl ,
              textInputAction: TextInputAction.next ,
              controller: titleController
          );
        }
    );
  }


  @override
  Consumer contentTextField({
    required TextEditingController contentController ,
    required ProviderListenable<BooleanState> providerListenable ,
    required InitCreateTodoState state
  }) {
    return Consumer(
        builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
          return state.app.globalWidgets.globalTextField(
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