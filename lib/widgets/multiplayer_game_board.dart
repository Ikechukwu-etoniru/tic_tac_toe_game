import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_toe_game/utils/colors.dart';

import '/provider/score_data.dart';
import '/widgets/game_board_buttons.dart';
import '/widgets/custom_dialog.dart';
import '/models/game_tile_model.dart';

class MultiPlayerGameBoard extends StatefulWidget {
  final String player1;
  final String player2;
  const MultiPlayerGameBoard(
      {required this.player1, required this.player2, Key? key})
      : super(key: key);

  @override
  _MultiPlayerGameBoardState createState() => _MultiPlayerGameBoardState();
}

class _MultiPlayerGameBoardState extends State<MultiPlayerGameBoard> {
  late List<GameTileModel> _buttonList;

  late List<int> _player1;
  late List<int> _player2;
  late int _activePlayer;

  @override
  void initState() {
    super.initState();
    _buttonList = _initiateBoard();
  }

  List<GameTileModel> _initiateBoard() {
    _player1 = [];
    _player2 = [];
    _activePlayer = 1;
    return List<GameTileModel>.generate(
      9,
      (index) => GameTileModel(id: index + 1),
    );
  }

  void _playGame(GameTileModel tile) async {
    setState(() {
      if (_activePlayer == 1) {
        // add x to the board
        tile.text = 'X';
        // chnage player to 2
        _activePlayer = 2;
        // add tile id to my player list
        _player1.add(tile.id);
      } else {
        tile.text = 'O';
        _activePlayer = 1;
        _player2.add(tile.id);
      }
      // disable button
      tile.isEnabled = true;
    });

    // check winner
    int winner = await checkWinner();

    if (winner == 1) {
      // Update scores
      Provider.of<ScoreData>(context, listen: false).multiPlayerAdd(winner);
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: '${widget.player1} won this round',
                restartGame: _restartGame);
          });
    } else if (winner == 2) {
      // Update scores
      Provider.of<ScoreData>(context, listen: false).multiPlayerAdd(winner);
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: '${widget.player2} won this round',
                restartGame: _restartGame);
          });
    } else if (winner == -1 &&
        _buttonList.every((element) => element.isEnabled == true)) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Undecided Game', restartGame: _restartGame);
          });
    }
  }

  Future<int> checkWinner() async {
    var winner = -1;

    if (_player1.contains(1) && _player1.contains(2) && _player1.contains(3)) {
      winner = 1;
    }

    if (_player1.contains(4) && _player1.contains(5) && _player1.contains(6)) {
      winner = 1;
    }
    if (_player1.contains(7) && _player1.contains(8) && _player1.contains(9)) {
      winner = 1;
    }
    if (_player1.contains(1) && _player1.contains(4) && _player1.contains(7)) {
      winner = 1;
    }
    if (_player1.contains(2) && _player1.contains(5) && _player1.contains(8)) {
      winner = 1;
    }
    if (_player1.contains(3) && _player1.contains(6) && _player1.contains(9)) {
      winner = 1;
    }
    if (_player1.contains(1) && _player1.contains(5) && _player1.contains(9)) {
      winner = 1;
    }
    if (_player1.contains(3) && _player1.contains(5) && _player1.contains(7)) {
      winner = 1;
    }
    //

    if (_player2.contains(1) && _player2.contains(2) && _player2.contains(3)) {
      winner = 2;
    }
    if (_player2.contains(4) && _player2.contains(5) && _player2.contains(6)) {
      winner = 2;
    }
    if (_player2.contains(7) && _player2.contains(8) && _player2.contains(9)) {
      winner = 2;
    }
    if (_player2.contains(1) && _player2.contains(4) && _player2.contains(7)) {
      winner = 2;
    }
    if (_player2.contains(2) && _player2.contains(5) && _player2.contains(8)) {
      winner = 2;
    }
    if (_player2.contains(3) && _player2.contains(6) && _player2.contains(9)) {
      winner = 2;
    }
    if (_player2.contains(1) && _player2.contains(5) && _player2.contains(9)) {
      winner = 2;
    }
    if (_player2.contains(3) && _player2.contains(5) && _player2.contains(7)) {
      winner = 2;
    }

    return winner;
  }

  void _restartGame() {
    setState(() {
      _buttonList = _initiateBoard();
    });
  }

  void _resetScore() {
    Provider.of<ScoreData>(context, listen: false).multiPlayerScoreEmpty();
    setState(() {
      _buttonList = _initiateBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              itemCount: _buttonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: _buttonList[index].isEnabled == false
                      ? () {
                          _playGame(_buttonList[index]);
                        }
                      : () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: _buttonList[index].text == ''
                        ? Text(_buttonList[index].text)
                        : Image.asset(
                            _buttonList[index].text == 'X'
                                ? 'images/x_pic.png'
                                : _buttonList[index].text == 'O'
                                    ? 'images/o_pic.png'
                                    : '',
                            fit: BoxFit.contain,
                          ),
                    decoration: BoxDecoration(
                      color: MyColors.darkModeScaffoldColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              }),
        ),
        Flexible(
          flex: 1,
          child: GameBoardButtons(
              restartGame: _restartGame, resetScore: _resetScore),
        ),
        // RichText(
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //           text: _activePlayer == 1
        //               ? '${widget.player1}\'s'
        //               : '${widget.player2}\'s',
        //           style: TextStyle(
        //             color: _activePlayer == 1 ? Colors.red : Colors.yellow,
        //           ),
        //         ),
        //         const TextSpan(
        //             text: 'turn', style: TextStyle(color: Colors.white))
        //       ],
        //     ),
        //   ),
      ],
    );
  }
}
