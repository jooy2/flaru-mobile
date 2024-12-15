import 'package:flare/app_router.dart';
import 'package:flare/utils/constants.dart';
import 'package:flutter/material.dart';

class FlareApp extends StatelessWidget {
  const FlareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate);
  }
}
