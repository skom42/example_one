import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigation/navigation.dart';

class VeeApp extends StatefulWidget {
  const VeeApp({
    Key? key,
  }) : super(key: key);

  @override
  State<VeeApp> createState() => _VeeAppState();
}

class _VeeAppState extends State<VeeApp> {
  late final AppRouterDelegate appRouter;
  late final RouteInformationParser<RouteConfiguration> routeInformationParser;

  @override
  void initState() {
    appRouter = appLocator.get<AppRouterDelegate>();
    routeInformationParser = appLocator.get<AppRouteInformationParser>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            useCountryCode: false,
            basePath: 'localization',
            fallbackFile: 'en',
            decodeStrategies: <BaseDecodeStrategy>[
              JsonDecodeStrategy(),
            ],
          ),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      routerDelegate: appRouter,
      routeInformationParser: routeInformationParser,
    );
  }
}
