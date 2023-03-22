import 'package:flutter/material.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/View/HomeTodo/init_home_todo.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_widgets.dart';



class MobileHomeTodoPage extends StatefulWidget {
  final InitHomeTodo state;

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
        floatingActionButton: widget.state.mobile.mobileFloatingActionButton(
            providerListenable: widget.state.main.notificationProv ,
            state: widget.state
        ),


        drawer: widget.state.main.drawerScreen() ,

        body: NestedScrollView(
            headerSliverBuilder: (BuildContext buildContext , inner) => [
              /// SliverAppBar
              mobileSliverAppBar(context:context) ,
            ],

            /// To Show User Data Builder


          body: FutureBuilder(
                future: widget.state.main.dbHelperController.fetchAllTodo() ,
                builder: (
                    BuildContext buildContext ,
                    AsyncSnapshot<List<Map<String,dynamic>>> snapshot
                    ) {
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
                          itemBuilder: (BuildContext buildContext , int i) {
                            final BaseTodoModel model = TodoModel.fromJson(snapshot.data!.elementAt(i));
                            final int id = snapshot.data!.elementAt(i)[ModelEnum.id.name];
                            return ListTile(
                              key: ValueKey<String>(id.toString()),
                              title: App.text.text(model.title.isEmpty ? "${snapshot.data!.elementAt(i)[ModelEnum.id.name]}" : model.title ) ,
                              subtitle: App.text.text(model.content) ,

                              onTap: () {
                                widget.state.main.navigateToUpdateScreen(
                                    state: widget.state ,
                                    context: context ,
                                    model: model ,
                                    id: id
                                );
                              },


                              leading: buildLeadingIconButton(
                                state: widget.state ,
                                context: context ,
                                onPressForYes: () async {
                                  setState(() {
                                    widget.state.main.deleteItem(
                                        state: widget.state,
                                        context: context,
                                        id: id
                                    );
                                  });
                                  widget.state.main.backScreen(context: context);
                                } ,
                              ),
                              );
                            }
                          );
                    }
                  }


                }
            )

        )

    );
  }
}