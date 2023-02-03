import 'package:todo_app/View/CreateTodo/main_create_todo_state.dart';
import 'package:todo_app/View/CreateTodo/mobile_create_todo_widgets.dart';
import 'package:todo_app/View/CreateTodo/tablet_create_todo_widgets.dart';
import 'package:todo_app/View/CreateTodo/web_create_todo_widgets.dart';



class InitCreateTodo {
  final BaseMainCreateTodoState main = MainCreateTodoState();
  final BaseMobileCrateTodoWidgets mobile = MobileCrateTodoWidgets();
  final BaseTabletCrateTodoWidgets tablet = TabletCrateTodoWidgets();
  final BaseWebCrateTodoWidgets web = WebCrateTodoWidgets();
}