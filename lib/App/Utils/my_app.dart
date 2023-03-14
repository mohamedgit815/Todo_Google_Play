import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/Utils/route_builder.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/controller.dart';
import 'package:todo_app/main.dart';



class MyApp extends ConsumerWidget {
  final App app;
  final Controller controller;

  const MyApp({
    Key? key ,
    required this.app ,
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

      themeMode: ThemeMode.light ,

       darkTheme: app.theme.darkThemeData(app: app) ,

       theme: app.theme.lightThemeData(app: app),

       initialRoute: RouteGenerators.homeScreen ,


      /// Localization
      locale: const Locale("en") ,
      //locale: Controller.global.switchLang(ref.watch(App.variable.langProvider).lang),
      supportedLocales: controller.localization.supportedLocales() ,
      localizationsDelegates: controller.localization.localizationsDelegates(),
      localeResolutionCallback: (Locale? currentLocal ,Iterable<Locale> supportedLocal){
        return controller.localization.localeResolutionCallback(currentLocal, supportedLocal);
      },

    );
  }
}


class TestPage extends StatefulWidget {
  final App app;
  const TestPage({Key? key , required this.app}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(onPressed: () {
            App.navigator.navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>Testing(app: widget.app)));
          } , child: const Text("data"),)
        ],
      ),
    );
  }
}



final ProviderListenable dataProv = ChangeNotifierProvider((ref) => BooleanState());