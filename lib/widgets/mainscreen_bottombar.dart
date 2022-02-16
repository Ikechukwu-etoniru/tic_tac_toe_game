import 'package:flutter/material.dart';

class MainScreenBottomBar extends StatefulWidget {
  const MainScreenBottomBar({Key? key}) : super(key: key);

  @override
  State<MainScreenBottomBar> createState() => _MainScreenBottomBarState();
}

class Player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

class _MainScreenBottomBarState extends State<MainScreenBottomBar> {
  static final countMatrix = 3;
  static final double size = 80;

  String lastMove = Player.none;

  late List<List<String>> matrix;

  @override
  void initState() {
    super.initState();

    setEmptyFields();
  }

  void setEmptyFields() {
    setState(() {
      matrix = List.generate(
        countMatrix,
        (index) => List.generate(countMatrix, (index) => Player.none),
      );
    });
  }

  Widget buildRow(int x) {
    final values = matrix[x];
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Utils.modelBuilder(
          values,
          (y, model) => buildField(x, y),
        ));
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          minimumSize: Size(size, size),
        ),
        onPressed: () {
          selectField(value, x, y);
        },
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      final newValue = lastMove == Player.X ? Player.O : Player.X;

      setState(() {
        lastMove = newValue;
        matrix[x][y] = newValue;
      });

      if (isWinner(x, y)) {
        showEndDialog('Player $newValue has won');
      }
    }
  }

  void showEndDialog(String title) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setEmptyFields();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Restart'))
            ],
          );
        });
  }

  bool isWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix[x][y];
    final n = countMatrix;

    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) col++;
      if (matrix[i][y] == player) row++;
      if (matrix[i][i] == player) diag++;
      if (matrix[i][n - i - 1] == player) rdiag++;
    }

    return row == n || col == n || diag == n || rdiag == n;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xff6a44d5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: Utils.modelBuilder(matrix, (x, model) => buildRow(x)),
      ),
    );
  }
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
