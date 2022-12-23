import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Core/ProviderState/provider_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Core/app.dart';

class GlobalController {
  /// To Hide The Keyboard for Screen
  void unFocusKeyBoard(BuildContext context) {
    return App.navigator.navigatorKey.currentState!.focusScopeNode.unfocus();
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

  /// To Cash Languages
  Locale switchLang(String lang) {

    SharedPreferences.getInstance().then((value) async {
      await value.setString('lang', lang);
    });

    if(lang == 'english'){
      lang = 'en';
    } else if(lang == 'arabic'){
      lang = 'ar';
    } else if(lang == 'espanol') {
      lang = 'es';
    }
    return Locale(lang,'');
  }

  /// To Ask User if he wants to exit Application or No
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