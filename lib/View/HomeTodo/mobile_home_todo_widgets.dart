import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/Utils/route_builder.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';



abstract class BaseMobileHomeTodoWidgets {
  /// SliverAppBar
  SliverAppBar mobileSliverAppBar({required BuildContext context});


  /// MobileFloatingActionButton
  Consumer mobileFloatingActionButton({
    required ProviderListenable<BooleanProvider> providerListenable ,
    required InitHomeTodo state
  });

  FutureBuilder<List<Map<String,dynamic>>> buildFutureBuilder({
    required InitHomeTodo state ,
    required BuildContext context ,
    required VoidCallback onPressForYes
  });

  IconButton buildLeadingIconButton({
    required VoidCallback onPressForYes ,
    required InitHomeTodo state ,
    required BuildContext context
  });

  ListTile buildListTile({
    required InitHomeTodo state ,
    required BuildContext context ,
    required int index ,
    required int id ,
    required BaseTodoModel model ,
    required Widget leadingWidget ,
    required AsyncSnapshot<List<Map<String,dynamic>>> snapshot
  });
}


class MobileHomeTodoWidgets implements BaseMobileHomeTodoWidgets {

  @override
  FutureBuilder<List<Map<String,dynamic>>> buildFutureBuilder({
    required InitHomeTodo state ,
    required BuildContext context ,
    required VoidCallback onPressForYes ,
  }) {
    return FutureBuilder(
        future: state.main.dbHelperController.fetchAllTodo() ,
        builder: (BuildContext buildContext , AsyncSnapshot<List<Map<String,dynamic>>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){

            return const Center(child: CircularProgressIndicator.adaptive());

          } else if (snapshot.connectionState == ConnectionState.none) {

            return const Center(child: CircularProgressIndicator.adaptive());

          } else {

            if(snapshot.data!.isEmpty) {
              return Center(child: App.text.text( "No Items" , fontSize: 25.0,));
            } else {
              return ListView.separated(
                  key: PageStorageKey<String>(StorageKeyEnum.pageStorageKeyHome.name) ,
                  physics: const BouncingScrollPhysics() ,
                  itemCount: snapshot.data!.length ,
                  separatorBuilder: (BuildContext buildContext , int i ) => const Divider(thickness: 2,) ,
                  itemBuilder: (BuildContext buildContext , int index) {
                    final BaseTodoModel model = TodoModel.fromJson(snapshot.data!.elementAt(index));
                    final int id = snapshot.data!.elementAt(index)[ModelEnum.id.name];
                    return state.mobile.buildListTile(
                        state: state ,
                        context: context ,
                        index: index ,
                        id: id ,
                        model: model ,
                        leadingWidget: state.mobile.buildLeadingIconButton(
                            onPressForYes: () async {
                              return await state.main.deleteItem(
                                  state: state ,
                                  context: context ,
                                  id: id
                              );
                            } ,
                            state: state,
                            context: context
                        ) ,
                        snapshot: snapshot
                    );
                  }
              );
            }
          }


        }
    );
  }

  @override
  ListTile buildListTile({
    required InitHomeTodo state ,
    required BuildContext context ,
    required int index ,
    required int id ,
    required BaseTodoModel model ,
    required Widget leadingWidget ,
    required AsyncSnapshot<List<Map<String,dynamic>>> snapshot
  }) {
    return ListTile(
      key: ValueKey<String>(snapshot.data!.elementAt(index)[ModelEnum.id.name].toString()),
      title: App.text.text(model.title.isEmpty ? "${snapshot.data!.elementAt(index)[ModelEnum.id.name]}" : model.title ) ,
      subtitle: App.text.text(model.content) ,
      onTap: () {
        state.main.navigateToUpdateScreen(
            state: state ,
            context: context ,
            model: model ,
            id: id
        );
      },


      leading: leadingWidget
    );
  }

  @override
  SliverAppBar mobileSliverAppBar({required BuildContext context}) {
    return SliverAppBar(
      title: CustomText(
          fontSize: 20.0,
          text: "${context.lang!.translate(LangEnum.homeScreen.name)}"),
      //text: "${Controller.global.translate(context: context, name: 'createScreen')}" ,
      centerTitle: true ,
      floating: true ,
      snap: true ,
      //pinned: true ,
      leading: Builder(
        builder: (context) {
          return IconButton(onPressed: () {
            context.scaffoldState.openDrawer();
          }, icon: Icon(Icons.menu_outlined,color: App.color.generalWhite,));
        }
      ),
    );
  }


  @override
  Consumer mobileFloatingActionButton({
    required ProviderListenable<BooleanProvider> providerListenable ,
    required InitHomeTodo state
  }) {

    return Consumer(
        builder: (context , prov , _) {
          return Visibility(
            visible: !prov.watch(providerListenable).boolean ? false : true ,
            child: App.globalWidgets.globalFloatingActionButton(
                onPress: () async {
                  /// HomeTodoController navigateToCreateTodoScreen
                  Navigator.of(context).pushNamed(RouteGenerators.createScreen);
                } ,
                child: const Icon(Icons.add)
            ),
          );
        }
    );
  }

  @override
  IconButton buildLeadingIconButton({
    required VoidCallback onPressForYes ,
    required InitHomeTodo state ,
    required BuildContext context
  }) {
    return IconButton(onPressed: () async {
      return await showDialog(
          context: context ,
          builder: (BuildContext b) => App.globalWidgets.globalAlertDialog(
              title: App.strings.sureDialog,
              onPressForNo: () async {
                return await state.main.backScreen(context: context);
              },
              onPressForYes: onPressForYes
          ));

    }, icon: const Icon(Icons.delete)

    );
  }
}