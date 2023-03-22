import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/my_app.dart';
import 'package:todo_app/Controller/app_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final Controller controller = Controller();

  if(!kIsWeb) {

    await controller.dbHelper.createDatabase();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp( ProviderScope(
        child: MyApp(
            controller: controller
        ))
    );

  }
}