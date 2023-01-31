import 'package:flutter/material.dart';
import 'package:todo_app/Core/app.dart';

abstract class BaseAppNavigator {
  late final GlobalKey<NavigatorState> navigatorKey ;


  Future<dynamic> backPageRouter({required BuildContext context, dynamic arguments});


  String pushNamedRouter({required String route ,required BuildContext context,dynamic arguments});


  String pushNamedAndReplaceRouter({required String route ,required BuildContext context,dynamic arguments});


  String pushNamedAndRemoveRouter({required String route ,required BuildContext context,dynamic arguments});
}


class AppNavigator implements BaseAppNavigator {

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  
  @override
  Future<dynamic> backPageRouter({required BuildContext context, dynamic arguments}) async {
    return await navigatorKey.currentState!.maybePop(arguments);
  }


  @override
  String pushNamedRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return navigatorKey.currentState!.restorablePushNamed(route,arguments: arguments);
  }


  @override
  String pushNamedAndReplaceRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return navigatorKey.currentState!.restorablePushReplacementNamed(route,arguments: arguments);
  }


  @override
  String pushNamedAndRemoveRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return navigatorKey.currentState!.restorablePushNamedAndRemoveUntil(route , (route) => false,arguments: arguments);
  }


}


abstract class BaseAppValidator {
  String? validatorName(String? v);

  String? validatorEmail(String? v);

  String? validatorPhone(String? v);

  String? validatorPw(String? v);
}


class AppValidator implements BaseAppValidator {
  @override
  String? validatorName(String? v) {
    return !v!.contains(App.regExp.regExpName) ? 'Enter your Name by write form' : null ;
  }

  @override
  String? validatorEmail(String? v) {
    return !v!.contains(App.regExp.regExpEmail) ? 'Enter your Email by write form' : null ;
  }

  @override
  String? validatorPhone(String? v) {
    return !v!.contains(App.regExp.regExpPhone) ? 'Enter your Phone by write form' : null;
  }

  @override
  String? validatorPw(String? v) {
    return !v!.contains(App.regExp.regExpPw) ? '[UpperCase , LowerCase , \$ ,# ,%]' : null;
  }
}