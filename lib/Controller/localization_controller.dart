import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Core/Utils/localization.dart';


abstract class BaseLocalizationController {
  /// To Switch Languages
  Locale switchLang(String lang);


  /// To Get Data Translate
  String? translate({required BuildContext context , required String name});


  /// To support any Languages
  Iterable<Locale> supportedLocales();

  /// To Add Delegate and add AppLocalization Delegate
  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates(){
    return const [
      AppLocalization.delegate ,
      GlobalWidgetsLocalizations.delegate ,
      GlobalMaterialLocalizations.delegate ,
      GlobalCupertinoLocalizations.delegate
    ];
  }

  /// To Handel if Happen any thing in languages will show English
  Locale? localeResolutionCallback(Locale? currentLocal ,Iterable<Locale> supportedLocal );

}


class LocalizationController implements BaseLocalizationController {

  @override
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


  @override
  String? translate({required BuildContext context , required String name}) {
    return AppLocalization.of(context)!.translate(name);
  }


  @override
  Iterable<Locale> supportedLocales() {
    return const [
      Locale("en","")  ,
      Locale("ar","") ,
      Locale('es','')
    ];
  }


  @override
  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates(){
    return const [
      AppLocalization.delegate ,
      GlobalWidgetsLocalizations.delegate ,
      GlobalMaterialLocalizations.delegate ,
      GlobalCupertinoLocalizations.delegate
    ];
  }


  @override
  Locale? localeResolutionCallback(Locale? currentLocal ,Iterable<Locale> supportedLocal ) {
    if( currentLocal != null ) {
      for( Locale loopLocal in supportedLocal ) {
        if( currentLocal.languageCode == loopLocal.languageCode ){
          return currentLocal;
        }
      }
    }
    return supportedLocal.first ;
  }
}