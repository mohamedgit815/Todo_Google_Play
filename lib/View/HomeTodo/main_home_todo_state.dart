import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';

abstract class BaseMainHomeTodoState {
  /// Variable

  late BaseDBHelperController dbHelperController;

  late ProviderListenable<BooleanState> notificationProv ;

}


class MainHomeTodoState implements BaseMainHomeTodoState {

  @override
  late BaseDBHelperController dbHelperController;


  @override
  ProviderListenable<BooleanState> notificationProv = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());



}