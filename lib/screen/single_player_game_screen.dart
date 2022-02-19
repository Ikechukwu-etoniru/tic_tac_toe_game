import 'package:flutter/material.dart';

import '/screen/game_screen.dart';
import '/screen/app_drawer.dart';

class SinglePlayerGameSCreen extends StatelessWidget {
  static const routeName = '/single_player_game_screen.dart';
  const SinglePlayerGameSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GameScreen.gameColor,
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: deviceSize.height * 0.25,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color:  Color(0xff6c44d4)
              ),
            ),
          )
        ],
      ),
    );
  }
}
