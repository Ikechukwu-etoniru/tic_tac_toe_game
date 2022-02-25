// Score board inbetween player1 and player2 or another player

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/score_data.dart';

class MultiPlayerScoreBoard extends StatefulWidget {
  
  const MultiPlayerScoreBoard({Key? key}) : super(key: key);

  @override
  _MultiPlayerScoreBoardState createState() => _MultiPlayerScoreBoardState();
}

class _MultiPlayerScoreBoardState extends State<MultiPlayerScoreBoard> {
  @override
  Widget build(BuildContext context) {
    final scoreData = Provider.of<ScoreData>(context);
    final player1Score = scoreData.player1Score;
    final player2Score = scoreData.player2Score;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: FittedBox(
            child: Text(
              player1Score.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Flexible(
          flex: 1,
          child: Text(
            '-',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 1,
          child: Text(
            player2Score.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
