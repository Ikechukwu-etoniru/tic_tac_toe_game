import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/game_screen.dart';

class CodeMultiPlayerPage extends StatelessWidget {
  const CodeMultiPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameScreen.gameColor,
      appBar: AppBar(
        title: const Text('Create/Input a code'),
        centerTitle: true,
      ),
    );
  }
}
