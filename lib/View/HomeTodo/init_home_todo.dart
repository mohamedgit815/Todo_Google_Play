import 'package:todo_app/Controller/app_controller.dart';
import 'package:todo_app/View/HomeTodo/main_home_todo_state.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_widgets.dart';
import 'package:todo_app/View/HomeTodo/tablet_home_todo_widgets.dart';
import 'package:todo_app/View/HomeTodo/web_home_todo_widgets.dart';


class InitHomeTodo {
  final Controller controller = Controller();
  final BaseMainHomeTodoState main = MainHomeTodoState();
  final BaseMobileHomeTodoWidgets mobile = MobileHomeTodoWidgets();
  final BaseTabletHomeTodoWidgets tablet = TabletHomeTodoWidgets();
  final BaseWebHomeTodoWidgets web = WebHomeTodoWidgets();

}