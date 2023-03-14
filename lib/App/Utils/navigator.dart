import 'package:flutter/material.dart';
import 'package:todo_app/App/app.dart';


abstract class BaseAppNavigator {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> backPageRouter({required BuildContext context, dynamic arguments});


  String pushNamedRouter({required String route ,required BuildContext context,dynamic arguments});


  String pushNamedAndReplaceRouter({required String route ,required BuildContext context,dynamic arguments});


  String pushNamedAndRemoveRouter({required String route ,required BuildContext context,dynamic arguments});
}


class AppNavigator extends BaseAppNavigator {

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

  String? validatorName({String? v , required App app});

  String? validatorEmail({String? v , required App app});

  String? validatorPhone({String? v , required App app});

  String? validatorPw({String? v , required App app});
}


class AppValidator extends BaseAppValidator {
  @override
  String? validatorName({String? v , required App app}) {
    return !v!.contains(app.regExp.regExpName) ? 'Enter your Name by write form' : null ;
  }

  @override
  String? validatorEmail({String? v , required App app}) {
    return !v!.contains(app.regExp.regExpEmail) ? 'Enter your Email by write form' : null ;
  }

  @override
  String? validatorPhone({String? v , required App app}) {
    return !v!.contains(app.regExp.regExpPhone) ? 'Enter your Phone by write form' : null;
  }

  @override
  String? validatorPw({String? v , required App app}) {
    return !v!.contains(app.regExp.regExpPw) ? '[UpperCase , LowerCase , \$ ,# ,%]' : null;
  }
}