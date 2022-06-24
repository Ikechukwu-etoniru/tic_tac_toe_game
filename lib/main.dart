import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_toe_game/screen/future_update_screen.dart';
import 'package:tic_toe_game/screen/online_multiplayer_game_screen.dart';
import 'package:tic_toe_game/utils/colors.dart';

import '/screen/select_names_screen.dart';
import '/provider/score_data.dart';
import '/screen/select_difficulty_screen.dart';
import '/screen/game_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: ((context) => ScoreData()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const GameScreen(),
          theme: ThemeData(
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: MyColors.darkModeScaffoldColor,
              appBarTheme: const AppBarTheme(
                  backgroundColor: MyColors.darkModeScaffoldColor,
                  elevation: 0)),
          routes: {
            SelectDifficultyScreen.routeName: (ctx) =>
                const SelectDifficultyScreen(),
            SelectNameScreen.routeName: (ctx) => const SelectNameScreen(),
            OnlineGameScreen.routeName: (ctx) => OnlineGameScreen(),
            FutureUpdateScreen.routeName: (ctx) => const FutureUpdateScreen()
          },
        ));
  }
}
