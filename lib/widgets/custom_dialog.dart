import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/statistics_screen.dart';
import 'package:tic_toe_game/utils/colors.dart';


class CustomDialog extends StatelessWidget {
  final String title;
  final Function restartGame;
  const CustomDialog({required this.title, required this.restartGame, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.darkModeScaffoldColor,
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {
            restartGame();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Restart',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        )
      ],
    );
  }
}
