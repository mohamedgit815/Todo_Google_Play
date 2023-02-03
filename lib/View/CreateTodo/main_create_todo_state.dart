import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/provider_state.dart';

/// Variables

abstract class BaseMainCreateTodoState {
  late final ProviderListenable<BooleanState> provTitleDirection;

  late final ProviderListenable<BooleanState> provContentDirection;

  late final RestorableTextEditingController titleController;

  late final RestorableTextEditingController contentController ;

  late BaseDBHelperController dbHelperController;
}


class MainCreateTodoState implements BaseMainCreateTodoState {

  @override
  ProviderListenable<BooleanState> provTitleDirection = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());


  @override
  ProviderListenable<BooleanState> provContentDirection = ChangeNotifierProvider<BooleanState>((ref) => BooleanState());


  @override
  RestorableTextEditingController titleController = RestorableTextEditingController();


  @override
  RestorableTextEditingController contentController = RestorableTextEditingController();

  @override
  late BaseDBHelperController dbHelperController;

}