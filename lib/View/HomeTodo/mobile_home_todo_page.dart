import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_widgets.dart';



class MobileHomeTodoPage extends ConsumerStatefulWidget {
  final InitHomeTodo home;

  const MobileHomeTodoPage({
    Key? key ,
    required this.home ,
  }) : super(key: key);

  @override
  ConsumerState<MobileHomeTodoPage> createState() => _MobileHomeTodoPageState();
}


class _MobileHomeTodoPageState extends ConsumerState<MobileHomeTodoPage>
 with MobileHomeTodoWidgets {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: mobileFloatingActionButton(
            providerListenable: widget.home.main.notificationProv ,
            onPress: () async {
              /// HomeTodoController navigateToCreateTodoScreen
              Controller.navigator.navigateToCreateTodoScreen(context);
            }
        ),

        body: NestedScrollView(
            headerSliverBuilder: (BuildContext buildContext , inner) => [
              /// SliverAppBar
              mobileSliverAppBar(context) ,
            ],


            /// To Show User Data Builder
            body: FutureBuilder(
                future: widget.home.main.dbHelperController.fetchAllTodo() ,
                builder: (BuildContext buildContext , AsyncSnapshot<List<Map<String,dynamic>>> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){

                    return const Center(child: CircularProgressIndicator.adaptive());

                  } else if (snapshot.connectionState == ConnectionState.none) {

                    return const Center(child: CircularProgressIndicator.adaptive());

                  } else {

                    if(snapshot.data!.isEmpty) {
                      return Center(child: App.text.text(text: "No Items" , fontSize: 25.0,));
                    } else {
                      return ListView.separated(
                          key: PageStorageKey<String>(StorageKeyEnum.pageStorageKeyHome.name) ,
                          physics: const BouncingScrollPhysics() ,
                          itemCount: snapshot.data!.length ,
                          separatorBuilder: (BuildContext buildContext , int i ) => const Divider(thickness: 2,) ,
                          itemBuilder: (BuildContext buildContext , int i) {
                            final BaseTodoModel model = TodoModel.fromJson(snapshot.data!.elementAt(i));
                            final int id = snapshot.data!.elementAt(i)[ModelEnum.id.name];
                            return ListTile(
                              key: ValueKey<String>(snapshot.data!.elementAt(i)[ModelEnum.id.name].toString()),
                              title: App.text.text(text: model.title.isEmpty ? "${snapshot.data!.elementAt(i)[ModelEnum.id.name]}" : model.title ) ,
                              subtitle: App.text.text(text: model.content ) ,
                              trailing: IconButton(onPressed: () async {
                                return await showDialog(
                                    context: context,
                                    builder: (BuildContext b)=>App.globalWidgets.globalAlertDialog(
                                        title: App.strings.sureDialog,
                                        onPressForNo: () {
                                          App.navigator.backPageRouter(context: context);
                                        },
                                        onPressForYes: (){
                                          setState(() {
                                            Controller.todo.deleteTodoController(id: id , context: context);
                                          });
                                          App.navigator.backPageRouter(context: context);
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