// Score board inbetween player and computer or another player

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/score_data.dart';
import '/screen/select_difficulty_screen.dart';

class ScoreBoard extends StatefulWidget {
  final Difficulty difficulty;
  const ScoreBoard(this.difficulty, {Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    final scoreData = Provider.of<ScoreData>(context);
    final player1Score = scoreData.getPlayerScore(widget.difficulty);
    final computerScore = scoreData.getComputerScore(widget.difficulty);
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
            computerScore.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
