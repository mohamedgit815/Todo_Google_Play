import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/Core/Utils/route_builder.dart';
import 'package:todo_app/Core/app.dart';


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Todo App' ,

      restorationScopeId: 'root' ,

      navigatorKey: App.navigator.navigatorKey ,

      onGenerateRoute: RouteGenerators.onGenerate ,

      themeMode: ThemeMode.dark ,

      darkTheme: App.theme.darkThemeData() ,

      initialRoute: RouteGenerators.homeScreen ,

      //locale: Controller.global.switchLang(ref.watch(App.variable.langProvider).lang),

      /// Localization
      locale: const Locale("en") ,

      // supportedLocales: const [
      //   Locale("en","")  ,
      //   Locale("ar","") ,
      //   Locale('es','')
      // ] ,

      supportedLocales: Controller.localization.supportedLocales() ,

      // localizationsDelegates: const [
      //   AppLocalization.delegate ,
      //   GlobalWidgetsLocalizations.delegate ,
      //   GlobalMaterialLocalizations.delegate ,
      //   GlobalCupertinoLocalizations.delegate
      // ],

      localizationsDelegates: Controller.localization.localizationsDelegates(),

      // localeResolutionCallback: ( currentLocal , supportedLocal ) {
      //   if( currentLocal != null ) {
      //     for( Locale loopLocal in supportedLocal ) {
      //       if( currentLocal.languageCode == loopLocal.languageCode ){
      //         return currentLocal;
      //       }
      //     }
      //   }
      //   return supportedLocal.first ;
      // },

      localeResolutionCallback: (Locale? currentLocal ,Iterable<Locale> supportedLocal){
        return Controller.localization.localeResolutionCallback(currentLocal, supportedLocal);
      },
    );
  }
}