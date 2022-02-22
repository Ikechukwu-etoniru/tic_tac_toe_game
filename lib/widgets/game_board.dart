import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/select_difficulty_screen.dart';

import '/screen/game_screen.dart';
import '/widgets/custom_dialog.dart';
import '/models/game_tile_model.dart';

class GameBoard extends StatefulWidget {
  final Difficulty difficulty;
  const GameBoard(this.difficulty,{Key? key}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<GameTileModel> buttonList;

  late List<int> player1;
  late List<int> player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonList = initiateBoard();
  }

  List<GameTileModel> initiateBoard() {
    player1 = [];
    player2 = [];
    activePlayer = 1;
    return List<GameTileModel>.generate(
      9,
      (index) => GameTileModel(id: index + 1),
    );
  }

  void playGame(GameTileModel tile) async {
    setState(() {
      if (activePlayer == 1) {
        // add x to the board
        tile.text = 'X';
        // chnage player to 2
        activePlayer = 2;
        // add tile id to my player list
        player1.add(tile.id);
      } else {
        tile.text = 'O';
        activePlayer = 1;
        player2.add(tile.id);
      }
      // disable button
      tile.isEnabled = true;
    });

    // check winner
    int winner = await checkWinner();

    if (winner == 1) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Player $winner won', restartGame: restartGame);
          });
    } else if (winner == 2) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Player $winner won', restartGame: restartGame);
          });
    } else if (winner == -1 &&
        buttonList.every((element) => element.isEnabled == true)) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Undecided Game', restartGame: restartGame);
          });
    } // adding ai logic
    else if (activePlayer == 2 && widget.difficulty == Difficulty.medium) {
      mediumAiPlay();
    } else if (activePlayer == 2 && widget.difficulty == Difficulty.easy) {
      easyAiPlay();
    } else if (activePlayer == 2 && widget.difficulty == Difficulty.hard) {
      easyAiPlay();
    }


  }

  void easyAiPlay() {
    Future.delayed(const Duration(seconds: 1), () {
      List<int> emptyTiles = [];
      List<int> list = List.generate(9, (index) {
        return index + 1;
      });

      for (var element in list) {
        if (!(player1.contains(element) || player2.contains(element))) {
          emptyTiles.add(element);
        }
      }

      var random = Random();
      if (emptyTiles.isEmpty) {
        // This if check is to prevent range error by passing 0 value to random.nextInt
      } else {
        var randomIndex = random.nextInt(emptyTiles.length);
        var tileId = emptyTiles[randomIndex];
        var aiTile = buttonList.indexWhere((element) => element.id == tileId);

        playGame(buttonList[aiTile]);
      }
    });
  }

  void mediumAiPlay() async {
    await Future.delayed(const Duration(seconds: 1));
    List<int> emptyTiles = [];
    List<int> list = List.generate(9, (index) {
      return index + 1;
    });

    for (var element in list) {
      if (!(player1.contains(element) || player2.contains(element))) {
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
        var aiTile = buttonList.indexWhere((element) => element.id == tileId);

        playGame(buttonList[aiTile]);
      }
    } else if (winning.length> 1) {
      // AI block or win logic
      playGame(buttonList[(winning[1]) - 1]);
    } else {
      playGame(buttonList[(winning[0]) - 1]);
    }

    
  }

  bool isWinning(int element) {
    player1.add(element);
    player2.add(element);
    bool isWin;
    if ((player1.contains(1) && player1.contains(2) && player1.contains(3)) ||
        (player1.contains(4) && player1.contains(5) && player1.contains(6)) ||
        (player1.contains(7) && player1.contains(8) && player1.contains(9)) ||
        (player1.contains(1) && player1.contains(4) && player1.contains(7)) ||
        (player1.contains(2) && player1.contains(5) && player1.contains(8)) ||
        (player1.contains(3) && player1.contains(6) && player1.contains(9)) ||
        (player1.contains(1) && player1.contains(5) && player1.contains(9)) ||
        (player1.contains(3) && player1.contains(5) && player1.contains(7)) ||
        (player2.contains(1) && player2.contains(2) && player2.contains(3)) ||
        (player2.contains(4) && player2.contains(5) && player2.contains(6)) ||
        (player2.contains(7) && player2.contains(8) && player2.contains(9)) ||
        (player2.contains(1) && player2.contains(4) && player2.contains(7)) ||
        (player2.contains(2) && player2.contains(5) && player2.contains(8)) ||
        (player2.contains(3) && player2.contains(6) && player2.contains(9)) ||
        (player2.contains(1) && player2.contains(5) && player2.contains(9)) ||
        (player2.contains(3) && player2.contains(5) && player2.contains(7))) {
      isWin = true;
    } else {
      isWin = false;
    }
    player1.remove(element);
    player2.remove(element);
    return isWin;
  }

  Future<int> checkWinner() async {
    var winner = -1;

    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    //

    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    return winner;
  }

  void restartGame() {
    setState(() {
      buttonList = initiateBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            restartGame();
          },
          child: Text(
            'restart',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              itemCount: buttonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: buttonList[index].isEnabled == false
                      ? () {
                          playGame(buttonList[index]);
                        }
                      : () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: buttonList[index].text == ''
                        ? Text(buttonList[index].text)
                        : Image.asset(
                            buttonList[index].text == 'X'
                                ? 'images/x_pic.png'
                                : buttonList[index].text == 'O'
                                    ? 'images/o_pic.png'
                                    : '',
                            fit: BoxFit.contain,
                          ),
                    decoration: BoxDecoration(
                      color: GameScreen.gameColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
