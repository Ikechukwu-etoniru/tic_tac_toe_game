import 'package:flutter/material.dart';

import '/screen/single_player_game_screen.dart';
import '/screen/app_drawer.dart';
import '/screen/game_screen.dart';

enum Difficulty { easy, medium, hard }

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
              color1: Colors.purpleAccent,
              color2: const Color(0xff6c44d4),
              text: 'Easy Bot',
              imageText: 'images/easy_pic.png',
              difficulty: Difficulty.easy,
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: SelectDifficultyContainer(
              height: deviceHeight * 0.15,
              width: deviceWidth * 0.9,
              color1: Colors.yellowAccent,
              color2: Colors.orange,
              text: 'Medium Bot',
              imageText: 'images/medium_pic.png',
              difficulty: Difficulty.medium,
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: SelectDifficultyContainer(
              height: deviceHeight * 0.15,
              width: deviceWidth * 0.9,
              color1: Colors.red,
              color2: Colors.cyan,
              text: 'Hard Bot',
              imageText: 'images/hard_pic.png',
              difficulty: Difficulty.hard,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectDifficultyContainer extends StatefulWidget {
  final double height;
  final double width;
  final Color color1;
  final Color color2;
  final String text;
  final String imageText;
  final Difficulty difficulty;
  const SelectDifficultyContainer(
      {required this.height,
      required this.width,
      required this.color1,
      required this.color2,
      required this.text,
      required this.imageText,
      required this.difficulty,
      Key? key})
      : super(key: key);

  @override
  State<SelectDifficultyContainer> createState() =>
      _SelectDifficultyContainerState();
}

class _SelectDifficultyContainerState extends State<SelectDifficultyContainer> {
  var onTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onTapped = true;
        });

        Future.delayed(const Duration(milliseconds: 80), () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => SinglePlayerGameScreen(
                difficulty: widget.difficulty,
              ),
            ),
          );
        }).then((value) {
          setState(() {
            onTapped = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        height: widget.height,
        width: widget.width,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: widget.height * 0.7,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.color2,
                  border: Border.all(color: Colors.yellow, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            CircleAvatar(
              radius: widget.height / 2,
              backgroundColor: widget.color1,
              child: Center(
                child: SizedBox(
                  height: widget.height * 0.64,
                  width: widget.height * 0.64,
                  child: Image.asset(
                    widget.imageText,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: widget.height / 2.8,
              left: widget.width / 2.5,
              child: Text(
                widget.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: widget.height / 2.8,
              right: 15,
              child: Icon(
                onTapped
                    ? Icons.lightbulb_rounded
                    : Icons.lightbulb_outline_rounded,
                color: Colors.yellowAccent,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
