import 'package:todo_app/View/CreateTodo/mobile_create_todo_widgets.dart';
import 'package:todo_app/View/CreateTodo/tablet_create_todo_widgets.dart';
import 'package:todo_app/View/CreateTodo/web_create_todo_widgets.dart';
import 'package:todo_app/View/HomeTodo/mobile_home_todo_widgets.dart';
import 'package:todo_app/View/HomeTodo/tablet_home_todo_widgets.dart';
import 'package:todo_app/View/HomeTodo/web_home_todo_widgets.dart';
import 'package:todo_app/View/UpdateTodo/mobile_update_todo_widgets.dart';
import 'package:todo_app/View/UpdateTodo/tablet_update_todo_widgets.dart';
import 'package:todo_app/View/UpdateTodo/web_update_todo_widgets.dart';


class Widgets {
  /// Create Todo Screens
  // Mobile
  static final BaseMobileCrateTodoWidgets createTodoMobile = MobileCrateTodoWidgets();
  // Tablet
  static final BaseTabletCrateTodoWidgets createTodoTablet = TabletCrateTodoWidgets();
  // Web
  static final BaseWebCrateTodoWidgets createTodoWeb = WebCrateTodoWidgets();


  /// Home Todo Screens
  // Mobile
  static final BaseMobileHomeTodoWidgets homeMobile = MobileHomeTodoWidgets();
  // Tablet
  static final BaseTabletHomeTodoWidgets homeTablet = TabletHomeTodoWidgets();
  // Web
  static final BaseWebHomeTodoWidgets webWeb = WebHomeTodoWidgets();

  /// Update Todo Screens
  // Mobile
  static final BaseMobileUpdateTodoWidgets updateMobile = MobileUpdateTodoWidgets();
  // Tablet
  static final BaseTabletUpdateTodoWidgets updateTablet = TabletUpdateTodoWidgets();
  // Web
  static final BaseWebUpdateTodoWidgets updateWeb = WebUpdateTodoWidgets();

}