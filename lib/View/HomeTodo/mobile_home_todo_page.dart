import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';
import 'package:todo_app/Core/Utils/general.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/widgets.dart';



class MobileHomeTodoPage extends ConsumerStatefulWidget {
  final BaseDBHelperController dbHelperController;
  final ProviderListenable<BooleanState> notificationProv;

  const MobileHomeTodoPage({
    Key? key ,
    required this.dbHelperController ,
    required this.notificationProv
  }) : super(key: key);

  @override
  ConsumerState<MobileHomeTodoPage> createState() => _MobileHomeTodoPageState();
}


class _MobileHomeTodoPageState extends ConsumerState<MobileHomeTodoPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Widgets.homeMobile.mobileFloatingActionButton(
            providerListenable: widget.notificationProv ,
            onPress: () async {
              /// HomeTodoController navigateToCreateTodoScreen
              Controller.navigator.navigateToCreateTodoScreen(context);
            }
        ),

        body: NestedScrollView(
            headerSliverBuilder: (BuildContext buildContext , inner) => [
              /// SliverAppBar
              Widgets.homeMobile.mobileSliverAppBar(context) ,
            ],


            /// To Show User Data Builder
            body: FutureBuilder(
                future: widget.dbHelperController.fetchAllTodo() ,
                builder: (BuildContext buildContext , AsyncSnapshot<List<Map<String,dynamic>>> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){

                    return const Center(child: CircularProgressIndicator.adaptive());

                  } else if (snapshot.connectionState == ConnectionState.none) {

                    return const Center(child: CircularProgressIndicator.adaptive());

                  } else {

                    if(snapshot.data!.isEmpty) {
                      return const Center(child: CustomText(text: "No Items" , fontSize: 25.0,));
                    } else {
                      return ListView.separated(
                          key: PageStorageKey<String>(ConstEnum.pageStorageKeyHome.name) ,
                          physics: const BouncingScrollPhysics() ,
                          itemCount: snapshot.data!.length ,
                          separatorBuilder: (BuildContext buildContext , int i ) => const Divider(thickness: 2,) ,
                          itemBuilder: (BuildContext buildContext , int i) {
                            final BaseTodoModel model = TodoModel.fromJson(snapshot.data!.elementAt(i));
                            final int id = snapshot.data!.elementAt(i)[ModelEnum.id.name];
                            return ListTile(
                              key: ValueKey<String>(snapshot.data!.elementAt(i)[ModelEnum.id.name].toString()),
                              title: CustomText(text: model.title.isEmpty ? "${snapshot.data!.elementAt(i)[ModelEnum.id.name]}" : model.title ) ,
                              subtitle: CustomText(text: model.content ) ,
                              trailing: IconButton(onPressed: () async {
                                return await showDialog(
                                    context: context,
                                    builder: (BuildContext b)=>App.globalWidgets.globalAlertDialog(
                                        title: App.strings.sureDialog,
                                        onPressForNo: () {
                                          Controller.navigator.backOneScreen(context);
                                        },
                                        onPressForYes: (){
                                          setState(() {
                                            Controller.todo.deleteTodoController(id: id , context: context);
                                          });
                                          Controller.navigator.backOneScreen(context);
                                        }
                                    ));

                              }, icon: const Icon(Icons.delete)),
                              onTap: () async {
                                // Navigator.of(context).restorablePushNamed(
                                //     RouteGenerators.nextPage,
                                //     arguments: [id , model.content] );
                                //App.navigator.pushNamedRouter(route: RouteGenerators.updateTodoScreen, context: context,arguments: [model ,id]);
                                Controller.navigator.navigateToUpdateTodoScreen(context: context,
                                    arguments: [
                                      id ,
                                      model.title ,
                                      model.content ,
                                      model.date ,
                                      model.checkTitleDirection ,
                                      model.checkContentDirection
                                    ]);
                                //await Navigator.of(context).pushNamed(RouteGenerators.updateTodoScreen , arguments: [id , model]);
                              },
                            );
                          });
                    }
                  }


                }
            )

        )

    );
  }


}

//
// class _MobileHomeTodoWidgets implements Testing {
//
//   /// SliverAppBar
//   SliverAppBar _mobileSliverAppBar(BuildContext context) {
//     return SliverAppBar(
//       title: CustomText(
//           fontSize: 20.0,
//           text: "${context.lang!.translate(LangEnum.homeScreen.name)}"),
//       //text: "${Controller.global.translate(context: context, name: 'createScreen')}" ,
//       centerTitle: true ,
//       floating: true ,
//       snap: true ,
//       //pinned: true ,
//     );
//   }
//
//
//   /// MobileFloatingActionButton
//   Consumer _mobileFloatingActionButton({
//     required ProviderListenable<BooleanState> providerListenable ,
//     required VoidCallback onPress
//   }) {
//     return Consumer(
//         builder: (context , prov , _) {
//           return Visibility(
//             visible: !prov.watch(providerListenable).boolean ? false : true ,
//             child: App.globalWidgets.globalFloatingActionButton(
//                 onPress: onPress ,
//                 child: const Icon(Icons.add)
//             ),
//           );
//         }
//     );
//   }
//
// }
