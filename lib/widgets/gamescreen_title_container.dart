import 'package:flutter/material.dart';

class GameTitleContainer extends StatelessWidget {
  const GameTitleContainer({Key? key}) : super(key: key);

  TextSpan colorText(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Using rich text to give the menu text diffrent colors
          RichText(
            text: TextSpan(
              children: [
                colorText('T', Colors.yellow),
                colorText('I', Colors.red),
                colorText('C', Colors.yellow),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                colorText('T', Colors.red),
                colorText('A', Colors.yellow),
                colorText('C', Colors.red),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                colorText('T', Colors.yellow),
                colorText('O', Colors.red),
                colorText('E', Colors.yellow),
              ],
            ),
          )
        ],
      ),
    );
  }
}
