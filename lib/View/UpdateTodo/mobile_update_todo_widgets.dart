import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/UpdateTodo/init_update.dart';


abstract class BaseMobileUpdateTodoWidgets {
  /// Appbar
  AppBar appBar({
    required int key , required BaseTodoModel model ,
    required ProviderListenable<BooleanProvider> providerListenable ,
    required VoidCallback onPressIcon ,
    required InitUpdateTodoState state

  });

  /// Floating Action Button
  floatingActionButton({
    required VoidCallback onPress ,
    required int key ,
    required InitUpdateTodoState state
  });

  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer titleTextField({
    required TextEditingController titleController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanProvider> providerListenable ,
    required InitUpdateTodoState state
  });


  /// GlobalWidget: Path is {Core/GlobalWidget/global_text_field.dart}
  Consumer contentTextField({
    required TextEditingController contentController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanProvider> providerListenable ,
    required InitUpdateTodoState state
  });
}


class MobileUpdateTodoWidgets implements BaseMobileUpdateTodoWidgets {
  @override
  AppBar appBar({
    required int key , required BaseTodoModel model ,
    required ProviderListenable<BooleanProvider> providerListenable ,
    required VoidCallback onPressIcon ,
    required InitUpdateTodoState state
  }) {
    return AppBar(
      key: ValueKey<int>(key),
      title: App.text.text(model.date.substring(0,19) , fontSize: 20.0) ,
      centerTitle: true ,
      //leading: const BackButton(),
      leading: IconButton(
          onPressed: onPressIcon ,
          icon: Icon(CupertinoIcons.back , color: App.color.generalWhite) ,
      ),
      actions: [
        Consumer(
            builder: (BuildContext buildContext , WidgetRef prov ,Widget? _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0) ,
                child: App.text.condition(
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
              );
            }
        )
      ],

    );
  }


  @override
  floatingActionButton({
    required VoidCallback onPress ,
    required int key ,
    required InitUpdateTodoState state
  }) {
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
    required ProviderListenable<BooleanProvider> providerListenable ,
    required InitUpdateTodoState state
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
              }, icon: const Icon(Icons.cached)),
              textDirection: prov.watch(providerListenable).boolean ? TextDirection.ltr : TextDirection.rtl
          );
        }
    );
  }


  @override
  Consumer contentTextField({
    required TextEditingController contentController ,
    required BaseTodoModel model ,
    required ProviderListenable<BooleanProvider> providerListenable ,
    required InitUpdateTodoState state
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