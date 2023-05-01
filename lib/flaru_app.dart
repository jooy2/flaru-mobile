import 'package:flaru/app_router.dart';
import 'package:flaru/utils/constants.dart';
import 'package:flutter/material.dart';

class FlaruApp extends StatelessWidget {
  const FlaruApp({Key? key}) : super(key: key);

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
