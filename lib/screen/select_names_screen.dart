import 'package:flutter/material.dart';

import '/screen/two_player_game_screen.dart';
import '/screen/app_drawer.dart';

class SelectNameScreen extends StatefulWidget {
  static const routeName = '/select_name_screen.dart';
  const SelectNameScreen({Key? key}) : super(key: key);

  @override
  State<SelectNameScreen> createState() => _SelectNameScreenState();
}

class _SelectNameScreenState extends State<SelectNameScreen> {
  var player1 = TextEditingController();

  var player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceHeight * 0.08,
            ),
            SizedBox(
              height: deviceHeight * 0.03,
              child: FittedBox(
                child: RichText(
                  text: TextSpan(
                    text: 'Player 1 - ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: player1.text.isEmpty ? '' : player1.text,
                        style: const TextStyle(
                            color: Colors.orange,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            SizedBox(
              height: deviceHeight * 0.1,
              width: deviceWidth * 0.9,
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                maxLength: 15,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
                keyboardType: TextInputType.text,
                controller: player1,
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.orange,
                  ),
                  contentPadding: const EdgeInsets.all(5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
              child: FittedBox(
                child: RichText(
                  text: TextSpan(
                    text: 'Player 2 - ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: player2.text.isEmpty ? '' : player2.text,
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            SizedBox(
              height: deviceHeight * 0.1,
              width: deviceWidth * 0.9,
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                maxLength: 15,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
                keyboardType: TextInputType.name,
                controller: player2,
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.yellow,
                  ),
                  contentPadding: const EdgeInsets.all(5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            SizedBox(
              height: deviceHeight * 0.065,
              child: Row(
                children: [
                  const Spacer(),
                  StartButton(
                      player1: player1,
                      player2: player2,
                      deviceHeight: deviceHeight,
                      deviceWidth: deviceWidth),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StartButton extends StatefulWidget {
  final TextEditingController player1;
  final TextEditingController player2;
  final double deviceHeight;
  final double deviceWidth;
  const StartButton(
      {required this.player1,
      required this.player2,
      required this.deviceHeight,
      required this.deviceWidth,
      Key? key})
      : super(key: key);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  void showErrorSnackBar(BuildContext context, String player) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$player has no name'),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 25,
        dismissDirection: DismissDirection.startToEnd,
        // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }

  var onTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.player1.text.isNotEmpty && widget.player2.text.isNotEmpty) {
          FocusScope.of(context).unfocus();
          setState(() {
            onTapped = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) {
                return TwoPlayerGameScreen(
                  player1: widget.player1.text,
                  player2: widget.player2.text,
                );
              }),
            );
          }).then((value) {
            setState(() {
              onTapped = false;
            });
          });
        } else if (widget.player1.text.isEmpty && widget.player2.text.isEmpty) {
          showErrorSnackBar(context, 'Player 1 and Player 2');
        } else if (widget.player1.text.isEmpty &&
            widget.player2.text.isNotEmpty) {
          showErrorSnackBar(context, 'Player 1');
        } else if (widget.player2.text.isEmpty &&
            widget.player1.text.isNotEmpty) {
          showErrorSnackBar(context, 'Player 2');
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: widget.deviceHeight * 0.065,
        width: widget.deviceWidth * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [Colors.yellow, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: FittedBox(
          child: Center(
            child: onTapped
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'START',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
          ),
        ),
      ),
    );
  }
}
