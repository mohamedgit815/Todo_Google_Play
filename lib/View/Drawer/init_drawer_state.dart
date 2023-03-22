import 'package:todo_app/Controller/app_controller.dart';
import 'package:todo_app/View/Drawer/main_drawer_state.dart';
import 'package:todo_app/View/Drawer/mobile_drawer_widgets.dart';
import 'package:todo_app/View/Drawer/tablet_drawer_widgets.dart';
import 'package:todo_app/View/Drawer/web_drawer_widgets.dart';

class InitDrawer {
  final Controller controller = Controller();
  final BaseDrawerState main = DrawerState();
  final BaseMobileDrawerWidgets mobile = MobileDrawerWidgets();
  final BaseTabletDrawerWidgets tablet = TabletDrawerWidgets();
  final BaseWebDrawerWidgets web = WebDrawerWidgets();
}