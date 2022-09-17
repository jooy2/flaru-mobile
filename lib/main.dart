import 'dart:io';

import 'package:flaru/flaru_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localhostServer.start();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(const FlaruApp());
}
