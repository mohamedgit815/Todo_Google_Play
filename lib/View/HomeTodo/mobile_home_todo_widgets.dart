import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';



abstract class BaseMobileHomeTodoWidgets {
  /// SliverAppBar
  SliverAppBar mobileSliverAppBar(BuildContext context);


  /// MobileFloatingActionButton
  Consumer mobileFloatingActionButton({
    required ProviderListenable<BooleanState> providerListenable ,
    required VoidCallback onPress ,
    required InitHomeTodoState initState
  });


}


class MobileHomeTodoWidgets implements BaseMobileHomeTodoWidgets {
  @override
  SliverAppBar mobileSliverAppBar(BuildContext context) {
    return SliverAppBar(
      title: CustomText(
          fontSize: 20.0,
          text: "${context.lang!.translate(LangEnum.homeScreen.name)}"),
      //text: "${Controller.global.translate(context: context, name: 'createScreen')}" ,
      centerTitle: true ,
      floating: true ,
      snap: true ,
      //pinned: true ,
    );
  }


  @override
  Consumer mobileFloatingActionButton({
    required ProviderListenable<BooleanState> providerListenable ,
    required VoidCallback onPress ,
    required InitHomeTodoState initState
  }) {
    return Consumer(
        builder: (context , prov , _) {
          return Visibility(
            visible: !prov.watch(providerListenable).boolean ? false : true ,
            child: initState.app.globalWidgets.globalFloatingActionButton(
                onPress: onPress ,
                child: const Icon(Icons.add)
            ),
          );
        }
    );
  }



}