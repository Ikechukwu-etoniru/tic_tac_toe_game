import 'package:flutter/material.dart';
import 'package:tic_toe_game/widgets/mainscreen_bottombar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff422d93),
      appBar: AppBar(
        backgroundColor: const Color(0xff422d93),
        elevation: 0,
      ),

      body: Column(
        children: [
          Container(
            height: deviceHeight * 0.3,
          ),
          Expanded(
            child: MainScreenBottomBar())
        ],
      ),
    );
  }
}
