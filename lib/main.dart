import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/select_difficulty_screen.dart';

import '/screen/single_player_game_screen.dart';
import '/screen/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Color(0xff331f73),
          )),
      home: const GameScreen(),
      routes: {
        SelectDifficultyScreen.routeName: (ctx) =>
            const SelectDifficultyScreen()
      },
    );
  }
}
