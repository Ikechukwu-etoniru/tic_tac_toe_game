import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/code_multiplayer_screen.dart';

import '/screen/app_drawer.dart';

class OnlineGameScreen extends StatelessWidget {
  static const routeName = '/online_game_screen.dart';
  OnlineGameScreen({Key? key}) : super(key: key);

  var player = TextEditingController();

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: deviceHeight * 0.08,
          ),
          SizedBox(
            height: deviceHeight * 0.03,
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                  text: 'Name - ',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: player.text.isEmpty ? '' : player.text,
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
              controller: player,
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
          Row(
            children: [
              const Spacer(),
              OnlineGameButtons(
                text: 'Search For Users',
                color1: Colors.yellow,
                color2: Colors.orange,
                player: player,
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
                id: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              OnlineGameButtons(
                text: 'Use code',
                color1: Colors.blueGrey,
                color2: Colors.cyanAccent,
                player: player,
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
                id: 2,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class OnlineGameButtons extends StatefulWidget {
  final TextEditingController player;
  final String text;
  final Color color1;
  final Color color2;
  final double deviceHeight;
  final double deviceWidth;
  final int id;
  const OnlineGameButtons(
      {required this.player,
      required this.text,
      required this.color1,
      required this.color2,
      required this.deviceHeight,
      required this.deviceWidth,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  _OnlineGameButtonsState createState() => _OnlineGameButtonsState();
}

class _OnlineGameButtonsState extends State<OnlineGameButtons> {
  void showErrorSnackBar(BuildContext context, String player) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Choose a name first'),
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
        if (widget.player.text.isNotEmpty) {
          FocusScope.of(context).unfocus();
          setState(() {
            onTapped = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            if (widget.id == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CodeMultiPlayerPage();
                  },
                ),
              );
            }
          }).then((value) {
            setState(() {
              onTapped = false;
            });
          });
        } else if (widget.player.text.isEmpty) {
          showErrorSnackBar(context, 'Choose a name first');
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: widget.deviceHeight * 0.065,
        width: widget.deviceWidth * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [widget.color1, widget.color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: widget.color1.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
            ),
            BoxShadow(
              color: widget.color2.withOpacity(0.3),
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
                : Text(
                    widget.text.toUpperCase(),
                    style: const TextStyle(
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
