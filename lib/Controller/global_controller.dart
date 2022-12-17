import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';

class GlobalController {
  /// To Hide The Keyboard for Screen
  void unFocusKeyBoard(BuildContext context) {
    return FocusScope.of(context).unfocus();
  }

  /// NotificationListener
  bool notificationListener({
    required UserScrollNotification notification ,
    required WidgetRef ref ,
    required ProviderListenable<ProviderState> providerListenable
  }) {
    if(notification.direction == ScrollDirection.forward) {
      ref.read(providerListenable).trueBoolean();
    } else if(notification.direction == ScrollDirection.reverse) {
      ref.read(providerListenable).falseBoolean();
    }
    return true;
  }


  /// Navigator To HomeScreen
  String navigatorHomeScreen(BuildContext context) {
    return App.navigator.pushNamedAndRemoveRouter(route: RouteGenerators.homeScreen, context: context);
  }

  /// Back Onc Screen
  Future<dynamic> backOneScreen(BuildContext context) async {
    return await App.navigator.backPageRouter(context: context);
  }
}