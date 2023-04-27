import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/core.dart';
import 'package:vee_app/app/vee_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Disable portrait mode
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  appDI.initDependencies();
  await dataDI.initDependencies();

  runApp(
    const VeeApp(),
  );
}
