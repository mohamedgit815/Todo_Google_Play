import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Controller/db_helper_controller.dart';
import 'package:todo_app/Core/Utils/my_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBHelperController().createDatabase();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp( const ProviderScope( child: MyApp() ));
}
