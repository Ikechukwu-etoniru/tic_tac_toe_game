import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback restartGame;
  const CustomDialog(
      {required this.title,
      
      required this.restartGame,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          onPressed: restartGame,
          child: const Text('Restart'),
        )
      ],
    );
  }
}
