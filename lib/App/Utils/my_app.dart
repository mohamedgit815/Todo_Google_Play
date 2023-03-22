import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/route_builder.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/app_controller.dart';

class MyApp extends ConsumerWidget {
  final Controller controller;

  const MyApp({
    Key? key ,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Todo App' ,

      restorationScopeId: 'root' ,

      navigatorKey: App.navigator.navigatorKey ,

      onGenerateRoute: RouteGenerators.onGenerate ,

      initialRoute: RouteGenerators.homeScreen ,


      /// Themes
      themeMode: ref.watch(App.theme.themeProvider).darkTheme ? ThemeMode.light : ThemeMode.dark ,
      darkTheme: App.theme.darkThemeData() ,
      theme: App.theme.lightThemeData() ,




      /// Localization
      locale: App.localization.switchLang(ref.watch(App.localization.langProvider).lang),
      supportedLocales: App.localization.supportedLocales() ,
      localizationsDelegates: App.localization.localizationsDelegates(),
      localeResolutionCallback: (Locale? currentLocal ,Iterable<Locale> supportedLocal){
        return App.localization.localeResolutionCallback(currentLocal, supportedLocal);
      },

    );
  }
}