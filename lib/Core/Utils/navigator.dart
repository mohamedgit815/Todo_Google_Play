import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/regular_expressions.dart';

class AppNavigator {

  Future<dynamic> backPageRouter({required BuildContext context, dynamic arguments}) async {
    return await Navigator.of(context).maybePop(arguments);
  }

  String pushNamedRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return Navigator.of(context).restorablePushNamed(route,arguments: arguments);
  }

  String pushNamedAndReplaceRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return Navigator.of(context).restorablePushReplacementNamed(route,arguments: arguments);
  }

  String pushNamedAndRemoveRouter({required String route ,required BuildContext context,dynamic arguments}) {
    return Navigator.of(context).restorablePushNamedAndRemoveUntil(route , (route) => false,arguments: arguments);
  }

}


class AppValidator {
  String? validatorName(String? v) {
    return !v!.contains(regExpName) ? 'Enter your Name by write form' : null ;
  }

  String? validatorEmail(String? v) {
    return !v!.contains(regExpEmail) ? 'Enter your Email by write form' : null ;
  }

  String? validatorPhone(String? v) {
    return !v!.contains(regExpPhone) ? 'Enter your Phone by write form' : null;
  }

  String? validatorPw(String? v) {
    return !v!.contains(regExpPw) ? '[UpperCase , LowerCase , \$ ,# ,%]' : null;
  }
}