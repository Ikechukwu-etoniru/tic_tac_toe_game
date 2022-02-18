import 'dart:math';

import 'package:flutter/material.dart';

import '/models/game_tile_model.dart';
import '/widgets/custom_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

  void playGame(GameTileModel tile) {
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

      // check winner
      int winner = checkWinner();

      if (winner == -1 &&
          buttonList.every((element) => element.isEnabled == true)) {
        showDialog(
            context: context,
            builder: (ctx) {
              return CustomDialog(
                  title: 'Undecided Game',
                  restartGame: () {
                    Navigator.of(context).pop();
                    restartGame();
                  });
            });
      }
      // adding ai logic
      else if (activePlayer == 2) {
        aiPlay();
      }
    });
  }

  void aiPlay() {
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
  }

  int checkWinner() {
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

    if (winner == 1) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Player $winner won',
                restartGame: () {
                  Navigator.of(context).pop();
                  restartGame();
                });
          });
    }
    if (winner == 2) {
      showDialog(
          context: context,
          builder: (ctx) {
            return CustomDialog(
                title: 'Player $winner won',
                restartGame: () {
                  Navigator.of(context).pop();
                  restartGame();
                });
          });
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe game'),
        centerTitle: true,
      ),
      body: GridView.builder(
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
                child: Text(buttonList[index].text),
                decoration: BoxDecoration(color: buttonList[index].color),
              ),
            );
          }),
    );
  }
}
