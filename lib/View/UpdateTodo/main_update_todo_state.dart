import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';

abstract class BaseMainUpdateTodoState {

  late final ProviderListenable<BooleanState> provUpdateTitleDirection ;

  late final ProviderListenable<BooleanState> provUpdateContentDirection ;

  late final TextEditingController titleController;

  late final TextEditingController contentController;

  late BaseDBHelperController dbHelperController;
}


class MainUpdateTodoState implements BaseMainUpdateTodoState {

  @override
  ProviderListenable<BooleanState> provUpdateTitleDirection = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());

  @override
  ProviderListenable<BooleanState> provUpdateContentDirection = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());

  @override
  TextEditingController titleController = TextEditingController();

  @override
  TextEditingController contentController = TextEditingController();

  @override
  late BaseDBHelperController dbHelperController;

}