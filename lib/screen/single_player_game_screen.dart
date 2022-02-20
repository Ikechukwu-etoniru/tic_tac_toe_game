import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/select_difficulty_screen.dart';

import '/screen/game_screen.dart';

class SinglePlayerGameSCreen extends StatelessWidget {
  final Difficulty difficulty;
  const SinglePlayerGameSCreen({required this.difficulty, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContainerHeight = MediaQuery.of(context).size.height * 0.25;
    return Scaffold(
      backgroundColor: GameScreen.gameColor,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: topContainerHeight,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerContainer(
                    height: topContainerHeight * 0.8,
                    color: Colors.purpleAccent,
                    text: 'Player 1',
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  PlayerContainer(
                    height: topContainerHeight * 0.8,
                    color: Colors.yellow,
                    text: 'Computer',
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xff6c44d4)),
            ),
          )
        ],
      ),
    );
  }
}

class PlayerContainer extends StatelessWidget {
  final double height;
  final Color color;
  final String text;
  const PlayerContainer(
      {required this.height, required this.color, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xff6c44d4).withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.yellowAccent, width: 0.4),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.08),
          CircleAvatar(
            radius: (height * 0.4) / 2,
            backgroundColor: color,
          ),
          SizedBox(height: height * 0.08),
          SizedBox(
            height: height * 0.16,
            child: FittedBox(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
