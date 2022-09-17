import 'package:flaru/screens/player_screen.dart';
import 'package:flutter/material.dart';

class FlaruApp extends StatelessWidget {
  const FlaruApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flaru',
        debugShowCheckedModeBanner: false,
        home: PlayerScreen());
  }
}
