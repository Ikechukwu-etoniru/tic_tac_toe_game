import 'package:flutter/material.dart';

import '/widgets/multiplayer_game_board.dart';
import '/widgets/multiplayer_score_board.dart';
import '/widgets/player_container.dart';

class TwoPlayerGameScreen extends StatelessWidget {
  final String player1;
  final String player2;
  const TwoPlayerGameScreen(
      {required this.player1, required this.player2, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContainerHeight = MediaQuery.of(context).size.height * 0.25;
    return Scaffold(
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
                    color: Colors.orange,
                    text: player1,
                    imageName: 'images/x_pic.png',
                    imageNamePlayer: 'images/player_pic.png',
                  ),
                  SizedBox(
                    height: topContainerHeight * 0.3,
                    width: 80,
                    child: const MultiPlayerScoreBoard(),
                  ),
                  PlayerContainer(
                    height: topContainerHeight * 0.8,
                    color: Colors.yellow,
                    text: player2,
                    imageName: 'images/o_pic.png',
                    imageNamePlayer: 'images/player_pic.png',
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xff6c44d4),
              ),
              child: MultiPlayerGameBoard(player1: player1, player2: player2),
            ),
          ),
        ],
      ),
    );
  }
}
