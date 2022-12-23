import 'package:flutter/material.dart';
import 'package:todo_app/Core/app.dart';

class AppNavigator {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> backPageRouter({required BuildContext context, dynamic arguments}) async {
    return await navigatorKey.currentState!.maybePop(arguments);
  }

  String pushNamedRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return navigatorKey.currentState!.restorablePushNamed(route,arguments: arguments);
  }

  String pushNamedAndReplaceRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return navigatorKey.currentState!.restorablePushReplacementNamed(route,arguments: arguments);
  }

  String pushNamedAndRemoveRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return navigatorKey.currentState!.restorablePushNamedAndRemoveUntil(route , (route) => false,arguments: arguments);
  }

}


class AppValidator {
  String? validatorName(String? v) {
    return !v!.contains(App.regExp.regExpName) ? 'Enter your Name by write form' : null ;
  }

  String? validatorEmail(String? v) {
    return !v!.contains(App.regExp.regExpEmail) ? 'Enter your Email by write form' : null ;
  }

  String? validatorPhone(String? v) {
    return !v!.contains(App.regExp.regExpPhone) ? 'Enter your Phone by write form' : null;
  }

  String? validatorPw(String? v) {
    return !v!.contains(App.regExp.regExpPw) ? '[UpperCase , LowerCase , \$ ,# ,%]' : null;
  }
}