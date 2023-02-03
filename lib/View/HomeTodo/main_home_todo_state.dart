import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';

abstract class BaseMainHomeTodoState {
  /// Variable
  late ProviderListenable<BooleanState> notificationProv ;


  late BaseDBHelperController dbHelperController;

}


class MainHomeTodoState implements BaseMainHomeTodoState {

  @override
  late ProviderListenable<BooleanState> notificationProv ;


  @override
  late BaseDBHelperController dbHelperController;

}