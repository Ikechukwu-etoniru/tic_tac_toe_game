import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_toe_game/utils/colors.dart';

import '/provider/score_data.dart';
import '/widgets/game_board_buttons.dart';
import '/screen/select_difficulty_screen.dart';
import '/widgets/custom_dialog.dart';
import '/models/game_tile_model.dart';

class GameBoard extends StatefulWidget {
  final Difficulty difficulty;
  const GameBoard(this.difficulty, {Key? key}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
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
      Provider.of<ScoreData>(context, listen: false)
          .playerAdd(1, widget.difficulty);
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'You won this round', restartGame: _restartGame);
          });
    } else if (winner == 2) {
      // Update scores
      Provider.of<ScoreData>(context, listen: false)
          .computerAdd(1, widget.difficulty);
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Computer won this round', restartGame: _restartGame);
          });
    } else if (winner == -1 &&
        _buttonList.every((element) => element.isEnabled == true)) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Undecided Game', restartGame: _restartGame);
          });
    } // adding ai logic
    else if (_activePlayer == 2 && widget.difficulty == Difficulty.medium) {
      _mediumAiPlay();
    } else if (_activePlayer == 2 && widget.difficulty == Difficulty.easy) {
      _easyAiPlay();
    } else if (_activePlayer == 2 && widget.difficulty == Difficulty.hard) {
      _hardAiPlay();
    }
  }

  void _easyAiPlay() {
    Future.delayed(const Duration(seconds: 1), () {
      List<int> emptyTiles = [];
      List<int> list = List.generate(9, (index) {
        return index + 1;
      });

      for (var element in list) {
        if (!(_player1.contains(element) || _player2.contains(element))) {
          emptyTiles.add(element);
        }
      }

      var random = Random();
      if (emptyTiles.isEmpty) {
        // This if check is to prevent range error by passing 0 value to random.nextInt
      } else {
        var randomIndex = random.nextInt(emptyTiles.length);
        var tileId = emptyTiles[randomIndex];
        var aiTile = _buttonList.indexWhere((element) => element.id == tileId);

        _playGame(_buttonList[aiTile]);
      }
    });
  }

  void _mediumAiPlay() async {
    await Future.delayed(const Duration(seconds: 1));
    List<int> emptyTiles = [];
    List<int> list = List.generate(9, (index) {
      return index + 1;
    });

    for (var element in list) {
      if (!(_player1.contains(element) || _player2.contains(element))) {
        emptyTiles.add(element);
      }
    }
    // List of tiles that should be blocked or used to win
    var winning = emptyTiles.where((element) {
      return isWinning(element) == true;
    }).toList();

    if (winning.isEmpty) {
      var random = Random();
      if (emptyTiles.isEmpty) {
        // This if check is to prevent range error by passing 0 value to random.nextInt
      } else {
        var randomIndex = random.nextInt(emptyTiles.length);
        var tileId = emptyTiles[randomIndex];
        var aiTile = _buttonList.indexWhere((element) => element.id == tileId);

        _playGame(_buttonList[aiTile]);
      }
    } else if (winning.length > 1) {
      // AI block or win logic
      _playGame(_buttonList[(winning[0]) - 1]);
    } else {
      _playGame(_buttonList[(winning[0]) - 1]);
    }
  }

  void _hardAiPlay() async {
    await Future.delayed(const Duration(seconds: 1));
    List<int> emptyTiles = [];
    List<int> list = List.generate(9, (index) {
      return index + 1;
    });

    for (var element in list) {
      if (!(_player1.contains(element) || _player2.contains(element))) {
        emptyTiles.add(element);
      }
    }
    // List of tiles that should be blocked or used to win
    var winning = emptyTiles.where((element) {
      return isWinning(element) == true;
    }).toList();

    if (winning.isEmpty) {
      var random = Random();
      if (emptyTiles.isEmpty) {
        // This if check is to prevent range error by passing 0 value to random.nextInt
      } else {
        var randomIndex = random.nextInt(emptyTiles.length);
        var tileId = emptyTiles[randomIndex];
        var aiTile = _buttonList.indexWhere((element) => element.id == tileId);

        _playGame(_buttonList[aiTile]);
      }
    } else if (winning.length > 1) {
      // AI block or win logic
      _playGame(_buttonList[(winning[0]) - 1]);
    } else {
      _playGame(_buttonList[(winning[0]) - 1]);
    }
  }

  bool isWinning(int element) {
    _player1.add(element);
    _player2.add(element);
    bool isWin;
    if ((_player1.contains(1) &&
            _player1.contains(2) &&
            _player1.contains(3)) ||
        (_player1.contains(4) &&
            _player1.contains(5) &&
            _player1.contains(6)) ||
        (_player1.contains(7) &&
            _player1.contains(8) &&
            _player1.contains(9)) ||
        (_player1.contains(1) &&
            _player1.contains(4) &&
            _player1.contains(7)) ||
        (_player1.contains(2) &&
            _player1.contains(5) &&
            _player1.contains(8)) ||
        (_player1.contains(3) &&
            _player1.contains(6) &&
            _player1.contains(9)) ||
        (_player1.contains(1) &&
            _player1.contains(5) &&
            _player1.contains(9)) ||
        (_player1.contains(3) &&
            _player1.contains(5) &&
            _player1.contains(7)) ||
        (_player2.contains(1) &&
            _player2.contains(2) &&
            _player2.contains(3)) ||
        (_player2.contains(4) &&
            _player2.contains(5) &&
            _player2.contains(6)) ||
        (_player2.contains(7) &&
            _player2.contains(8) &&
            _player2.contains(9)) ||
        (_player2.contains(1) &&
            _player2.contains(4) &&
            _player2.contains(7)) ||
        (_player2.contains(2) &&
            _player2.contains(5) &&
            _player2.contains(8)) ||
        (_player2.contains(3) &&
            _player2.contains(6) &&
            _player2.contains(9)) ||
        (_player2.contains(1) &&
            _player2.contains(5) &&
            _player2.contains(9)) ||
        (_player2.contains(3) &&
            _player2.contains(5) &&
            _player2.contains(7))) {
      isWin = true;
    } else {
      isWin = false;
    }
    _player1.remove(element);
    _player2.remove(element);
    return isWin;
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
    Provider.of<ScoreData>(context, listen: false).scoreEmpty();
    setState(() {
      _buttonList = _initiateBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
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
      ],
    );
  }
}
