import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


abstract class BaseGlobalHelper {

  /// To Hide The Keyboard for Screen
  void unFocusKeyBoard(BuildContext context);


  /// Check Keyboard if Hide or No
  bool checkKeyboard(BuildContext context);


  /// NotificationListener
  bool notificationListener({
    required UserScrollNotification notification ,
    required WidgetRef ref ,
    required ProviderListenable<BooleanProvider> providerListenable
  });


  /// To Ask User if he wants to exit Application or No
  Future<bool> customExitApp({required DateTime dateTime});
}


class GlobalHelper extends BaseGlobalHelper {

  @override
  void unFocusKeyBoard(BuildContext context) {
    return App.navigator.navigatorKey.currentState!.focusNode.unfocus();
  }


  @override
  bool checkKeyboard(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0;
  }


  @override
  bool notificationListener({
    required UserScrollNotification notification ,
    required WidgetRef ref ,
    required ProviderListenable<BooleanProvider> providerListenable
  }) {
    if(notification.direction == ScrollDirection.forward) {
      ref.read(providerListenable).trueBoolean();
    } else if(notification.direction == ScrollDirection.reverse) {
      ref.read(providerListenable).falseBoolean();
    }
    return true;
  }


  @override
  Future<bool> customExitApp({required DateTime dateTime}) async {
    final Duration varDifference = DateTime.now().difference(dateTime);
    final isExitWarning = varDifference >= const Duration(seconds: 2);
    dateTime = DateTime.now();

    if(isExitWarning){
      // await Fluttertoast.showToast(msg: 'Press back again to exit',fontSize: 17.0);
      return false;
    }else{
      // await Fluttertoast.cancel();
      return true;
    }
  }

}