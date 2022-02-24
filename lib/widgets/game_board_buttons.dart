import 'package:flutter/material.dart';

class GameBoardButtons extends StatelessWidget {
  final VoidCallback restartGame;
  final VoidCallback resetScore;
  const GameBoardButtons(
      {required this.restartGame, required this.resetScore, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResetButtons(
                height: constraint.maxHeight * 0.45,
                width: constraint.maxWidth * 0.35,
                color: Colors.red,
                function: resetScore,
                text: 'Reset Score',
              ),
              const SizedBox(width: 15),
              ResetButtons(
                height: constraint.maxHeight * 0.45,
                width: constraint.maxWidth * 0.35,
                color: Colors.yellow,
                function: restartGame,
                text: 'Restart Game',
              )
            ],
          ),
        ),
      );
    });
  }
}

class ResetButtons extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final VoidCallback function;
  final String text;
  const ResetButtons(
      {required this.height,
      required this.width,
      Key? key,
      required this.color,
      required this.function,
      required this.text})
      : super(key: key);

  @override
  _ResetButtonsState createState() => _ResetButtonsState();
}

class _ResetButtonsState extends State<ResetButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: widget.color.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10),
          ],
        ),
        child: FittedBox(
          child: Text(
            widget.text,
            style: TextStyle(
                color:
                    widget.color == Colors.red ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
