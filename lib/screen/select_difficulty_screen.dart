import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/screen/game_screen.dart';

class SelectDifficultyScreen extends StatelessWidget {
  static const routeName = '/select_difficulty_screen';
  const SelectDifficultyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: GameScreen.gameColor,
        drawer: const AppDrawer(),
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.08,
            ),
            Center(
              child: SizedBox(
                height: deviceHeight * 0.12,
                width: deviceWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Difficulty',
                      style: TextStyle(
                          letterSpacing: 2,
                          wordSpacing: 5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Divider(
                      thickness: 3,
                      color: Colors.yellow,
                      endIndent: deviceWidth * 0.5,
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: SelectDifficultyContainer(
              height: deviceHeight * 0.15,
              width: deviceWidth * 0.9,
            ))
          ],
        ));
  }
}

class SelectDifficultyContainer extends StatelessWidget {
  final double height;
  final double width;
  const SelectDifficultyContainer(
      {required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: height * 0.7,
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 1),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          CircleAvatar(
            radius: height / 2,
          )
        ],
      ),
    );
  }
}
