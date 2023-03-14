import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/route_builder.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_widgets.dart';



class MobileHomeTodoPage extends StatefulWidget {
  final InitHomeTodoState state;

  const MobileHomeTodoPage({
    Key? key ,
    required this.state ,
  }) : super(key: key);

  @override
  State<MobileHomeTodoPage> createState() => _MobileHomeTodoPageState();
}

class _MobileHomeTodoPageState extends State<MobileHomeTodoPage> with MobileHomeTodoWidgets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: mobileFloatingActionButton(
          initState: widget.state ,
            providerListenable: widget.state.main.notificationProv ,
            onPress: () async {
              /// HomeTodoController navigateToCreateTodoScreen
              Navigator.of(context).pushNamed(RouteGenerators.createScreen);
              //widget.state.app.navigator.navigatorKey.currentState!.pushNamed(RouteGenerators.createScreen);
              //widget.state.controller.navigator.navigateToCreateTodoScreen(context:context , app: widget.state.app);
            }
        ),

        body: NestedScrollView(
            headerSliverBuilder: (BuildContext buildContext , inner) => [
              /// SliverAppBar
              mobileSliverAppBar(context) ,
            ],

            /// To Show User Data Builder
            body: FutureBuilder(
                future: widget.state.main.dbHelperController.fetchAllTodo() ,
                builder: (BuildContext buildContext , AsyncSnapshot<List<Map<String,dynamic>>> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){

                    return const Center(child: CircularProgressIndicator.adaptive());

                  } else if (snapshot.connectionState == ConnectionState.none) {

                    return const Center(child: CircularProgressIndicator.adaptive());

                  } else {

                    if(snapshot.data!.isEmpty) {
                      return Center(child: widget.state.app.text.text(text: "No Items" , fontSize: 25.0,));
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
                              title: widget.state.app.text.text(text: model.title.isEmpty ? "${snapshot.data!.elementAt(i)[ModelEnum.id.name]}" : model.title ) ,
                              subtitle: widget.state.app.text.text(text: model.content ) ,
                              trailing: IconButton(onPressed: () async {
                                return await showDialog(
                                    context: context ,
                                    builder: (BuildContext b)=>widget.state.app.globalWidgets.globalAlertDialog(
                                        title: widget.state.app.strings.sureDialog,
                                        onPressForNo: () {
                                          App.navigator.backPageRouter(context: context);
                                        },
                                        onPressForYes: (){
                                          setState(() {
                                            widget.state.controller.todo.deleteTodoController(
                                                id: id ,
                                                context: context ,
                                              controller: widget.state.controller ,
                                              app: widget.state.app
                                            );
                                          });
                                          App.navigator.backPageRouter(context: context);
                                        }
                                    ));

                              }, icon: const Icon(Icons.delete)),
                              onTap: () {
                                widget.state.main.navigateToUpdateScreen(
                                    state: widget.state,
                                    context: context,
                                    model: model,
                                    id: id
                                );
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