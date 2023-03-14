import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/my_app.dart';
import 'package:todo_app/App/app.dart';
import 'package:todo_app/Controller/controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final App app = App();
   final Controller controller = Controller();

  if(!kIsWeb) {

    await controller.dbHelper.createDatabase();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    //runApp( ProviderScope( child: Testing(app: app,) ));
    runApp( ProviderScope( child: MyApp(app: app , controller: controller) ));

  }
}

class Testing extends StatelessWidget {
  final App app;

  const Testing({Key? key , required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: TestPage() ,
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: const Text("Testing"),centerTitle: true,),);
  }
}
