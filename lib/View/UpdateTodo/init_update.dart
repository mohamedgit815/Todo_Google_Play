import 'package:todo_app/Controller/app_controller.dart';
import 'package:todo_app/View/UpdateTodo/main_update_todo_state.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_widgets.dart';
import 'package:todo_app/View/UpdateTodo/tablet_update_todo_widgets.dart';
import 'package:todo_app/View/UpdateTodo/web_update_todo_widgets.dart';



class InitUpdateTodoState {
  final Controller controller = Controller();
  final BaseMainUpdateTodoState main = MainUpdateTodoState();
  final BaseMobileUpdateTodoWidgets mobile = MobileUpdateTodoWidgets();
  final BaseTabletUpdateTodoWidgets tablet = TabletUpdateTodoWidgets();
  final BaseWebUpdateTodoWidgets web = WebUpdateTodoWidgets();
}