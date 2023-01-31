import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Core/Utils/general.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';

abstract class BaseMobileUpdateTodoWidgets {
  /// Appbar
  AppBar appBar({
    required int key , required BaseTodoModel model ,
    required ProviderListenable<BooleanState> providerListenable
  });

  /// Floating Action Button
  floatingActionButton({required VoidCallback onPress ,required int key});

  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer titleTextField({
    required TextEditingController titleController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanState> providerListenable
  });


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer contentTextField({
    required TextEditingController contentController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanState> providerListenable
  });
}


class MobileUpdateTodoWidgets implements BaseMobileUpdateTodoWidgets {
  @override
  AppBar appBar({
    required int key , required BaseTodoModel model ,
    required ProviderListenable<BooleanState> providerListenable
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
                child: AnimatedConditional(
                    state: prov.watch(providerListenable).boolean ,

                    first: InkWell(
                        onTap: () {
                          /// To Change Direction for TextField
                          prov.read(providerListenable).switchBoolean();
                        } ,
                        child: const Text("RTL")) ,

                    second: InkWell(
                        onTap: () {
                          /// To Change Direction for TextField
                          prov.read(providerListenable).switchBoolean();
                        } ,
                        child: const Text("LTR"))
                ),
                // child: App.conditional(
                //   condition: prov.watch(providerListenable).boolean ,
                //   builder: (BuildContext buildContext){
                //     return InkWell(
                //         onTap: () {
                //           /// To Change Direction for TextField
                //           prov.read(providerListenable).switchBoolean();
                //         } ,
                //         child: const Text("RTL"));
                //   } ,
                //   fallback: (BuildContext buildContext){
                //     return InkWell(
                //         onTap: () {
                //           /// To Change Direction for TextField
                //           prov.read(providerListenable).switchBoolean();
                //         },
                //         child: const Text("LTR"));
                //   } ,
                // ),
              );
            }
        )
      ],
    );
  }


  @override
  floatingActionButton({required VoidCallback onPress ,required int key}) {
    return App.globalWidgets.globalFloatingActionButton(
        key: ValueKey<int>(key) ,
        onPress: onPress ,
        child: const Icon(Icons.add)
    );
  }


  @override
  Consumer titleTextField({
    required TextEditingController titleController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanState> providerListenable
  }) {
    return Consumer(
        builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
          return App.globalWidgets.globalTextField(
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


  @override
  Consumer contentTextField({
    required TextEditingController contentController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanState> providerListenable
  }) {
    return Consumer(
        builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
          return App.globalWidgets.globalTextField(
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