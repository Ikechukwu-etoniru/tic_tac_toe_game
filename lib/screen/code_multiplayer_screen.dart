import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/game_screen.dart';

class CodeMultiPlayerPage extends StatefulWidget {
  const CodeMultiPlayerPage({Key? key}) : super(key: key);

  @override
  State<CodeMultiPlayerPage> createState() => _CodeMultiPlayerPageState();
}

class _CodeMultiPlayerPageState extends State<CodeMultiPlayerPage> {
  String? choosenCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameScreen.gameColor,
      appBar: AppBar(
        title: const Text('Create/Input a code'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Create a Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  choosenCode = value;
                }
              },
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white, letterSpacing: 4),
              maxLength: 6,
              decoration: InputDecoration(
                counterStyle: const TextStyle(color: Colors.white),
                hintText: 'Pick any 6 digits',
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.5),
                  borderRadius: BorderRadius.circular(13),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.yellow, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create Code'),
              //jjjjjjjjj
            )
          ],
        ),
      ),
    );
  }
}
