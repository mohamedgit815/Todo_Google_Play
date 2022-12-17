import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Controller/global_controller.dart';
import 'package:todo_app/Controller/home_todo_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/app.dart';
import 'package:todo_app/Model/todo_model.dart';



class MobileHomeTodoPage extends ConsumerStatefulWidget {
  final BoxConstraints constraints;
  const MobileHomeTodoPage({Key? key , required this.constraints}) : super(key: key);

  @override
  ConsumerState<MobileHomeTodoPage> createState() => _MobileHomeTodoPageState();
}

class _MobileHomeTodoPageState extends ConsumerState<MobileHomeTodoPage>
    with _MobileHomeTodoWidgets  , HomeTodoController,
        DBHelperController , GlobalController {

  @override
  void initState() {
    super.initState();
    dbHelperController = DBHelperController();
  }


  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (UserScrollNotification notification) {
        /// HomeTodoController notificationListener
        return notificationListener(notification: notification, ref: ref , providerListenable: notificationProv);
      },
      child: Scaffold(
        floatingActionButton: _mobileFloatingActionButton(
          providerListenable: notificationProv ,
          onPress: () async {
            /// HomeTodoController navigateToCreateTodoScreen
             navigateToCreateTodoScreen(context);
          }
        ),

        body: NestedScrollView(
            headerSliverBuilder: (BuildContext buildContext , inner) => [
              /// SliverAppBar
              _mobileSliverAppBar() ,
            ],


            /// To Show User Data Builder
            body: FutureBuilder(
                future: fetchAllTodo() ,
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
                        key: PageStorageKey<String>(App.constance.pageStorageKeyHome) ,
                          physics: const BouncingScrollPhysics() ,
                          itemCount: snapshot.data!.length ,
                          separatorBuilder: (BuildContext buildContext , int i ) => const Divider(thickness: 2,) ,
                          itemBuilder: (BuildContext buildContext , int i) {
                            final TodoModel model = TodoModel.fromJson(snapshot.data!.elementAt(i));
                            final int id = snapshot.data!.elementAt(i)['id'];
                            return ListTile(
                              key: ValueKey<String>(snapshot.data!.elementAt(i)['id'].toString()),
                              title: CustomText(text: model.title.isEmpty ? "${snapshot.data!.elementAt(i)['id']}" : model.title ) ,
                              subtitle: CustomText(text: model.content ) ,
                              trailing: IconButton(onPressed: () async {
                               return await showDialog(
                                   context: context,
                                   builder: (BuildContext b)=>App.globalAlertDialog(
                                       title: App.constance.sureDialog,
                                       onPressForNo: () {
                                         backOneScreen(context);
                                       },
                                       onPressForYes: (){
                                         setState(() {
                                           deleteItem(id: id , context: context);
                                         });
                                         backOneScreen(context);
                                       }
                                   ));

                              }, icon: const Icon(Icons.delete)),
                              onTap: () async {
                                // Navigator.of(context).restorablePushNamed(
                                //     RouteGenerators.nextPage,
                                //     arguments: [id , model.content] );
                                //App.navigator.pushNamedRouter(route: RouteGenerators.updateTodoScreen, context: context,arguments: [model ,id]);
                                navigateToUpdateTodoScreen(context: context, arguments: [id , model.title , model.content , model.date]);
                                //await Navigator.of(context).pushNamed(RouteGenerators.updateTodoScreen , arguments: [model ,id]);
                              },
                            );
                          });
                    }
                  }


            }
            )


        )

      ),
    );
  }


}

class _MobileHomeTodoWidgets {

  /// SliverAppBar
  SliverAppBar _mobileSliverAppBar() {
    return SliverAppBar(
      title: CustomText(text: App.constance.appbarHomeScreen , fontSize: 20.0,) ,
      centerTitle: true ,
      floating: true ,
      snap: true ,
      //pinned: true ,
    );
  }


  /// MobileFloatingActionButton
  Consumer _mobileFloatingActionButton({
    required ProviderListenable<ProviderState> providerListenable ,
    required VoidCallback onPress
  }) {
    return Consumer(
        builder: (context , prov , _) {
          return Visibility(
            visible: !prov.watch(providerListenable).boolean ? false : true ,
            child: App.globalFloatingActionButton(
                onPress: onPress ,
                child: const Icon(Icons.add)
            ),
          );
        }
    );
  }

}