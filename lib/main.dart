import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_toe_game/screen/select_names_screen.dart';

import '/provider/score_data.dart';
import '/screen/select_difficulty_screen.dart';
import '/screen/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScoreData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Color(0xff331f73),
            ),
            fontFamily: 'Poppins'),
        home: const GameScreen(),
        routes: {
          SelectDifficultyScreen.routeName: (ctx) =>
              const SelectDifficultyScreen(),
          SelectNameScreen.routeName: (ctx) => SelectNameScreen()
        },
      ),
    );
  }
}
