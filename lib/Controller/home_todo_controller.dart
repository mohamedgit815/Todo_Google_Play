import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/custom_widgets.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';


class HomeTodoController {
  /// Variable
  final ChangeNotifierProvider<ProviderState> notificationProv = ChangeNotifierProvider<ProviderState>((ref) => ProviderState());
  late DBHelperController dbHelperController;


  /// Navigator to Create TodoScreen
  String navigateToCreateTodoScreen(BuildContext context)  {
    return App.navigator.pushNamedRouter(route: RouteGenerators.createScreen, context: context);
  }

  /// Navigator to UpdateTodoScreen
  String navigateToUpdateTodoScreen({required BuildContext context , required List<dynamic> arguments}) {
    return App.navigator.pushNamedRouter(route: RouteGenerators.updateTodoScreen, context: context , arguments: arguments);
  }


  /// To Delete Item from HomeTodoScreen
  Future<void> deleteItem({required int id , required BuildContext context}) async {
     await dbHelperController.deleteTodo(id).then((value) {
      customSnackBar(text: App.constance.homeScreenDeleted , context: context);
    }).catchError((err){
       customSnackBar(text: err.toString() , context: context);
     });
  }

}