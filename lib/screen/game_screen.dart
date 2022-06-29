import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tic_toe_game/screen/future_update_screen.dart';

import '/screen/select_difficulty_screen.dart';
import '/screen/select_names_screen.dart';
import '/widgets/gamescreen_title_container.dart';
import '/widgets/glowing_button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Future<bool> _closeApp() async {
    return await (showDialog<bool>(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                title: const Text(
                  'Confirm Exit...!!!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                content: const Text('Are you sure you want to exit app'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(ctx).pop(true);
                     SystemNavigator.pop();
                    },
                    child: const Text('Yes'),
                  )
                ],
              );
            })) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _closeApp,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
                height: deviceSize.height * 0.45,
                child: const GameTitleContainer()),
            Expanded(
              child: Column(
                children: [
                  GlowingButton(
                      color1: Colors.pink,
                      color2: Colors.purple,
                      text: 'Single Player',
                      navigate: () {
                        Navigator.of(context)
                            .pushNamed(SelectDifficultyScreen.routeName);
                      },
                      height: deviceSize.height * 0.06,
                      width: deviceSize.width * 0.7),
                  const SizedBox(
                    height: 20,
                  ),
                  GlowingButton(
                      color1: Colors.yellow,
                      color2: Colors.orange,
                      text: 'Local Multiplayer',
                      navigate: () {
                        Navigator.of(context)
                            .pushNamed(SelectNameScreen.routeName);
                      },
                      height: deviceSize.height * 0.06,
                      width: deviceSize.width * 0.7),
                  const SizedBox(
                    height: 20,
                  ),
                  GlowingButton(
                      color1: Colors.cyan,
                      color2: Colors.green,
                      text: 'Online Multiplayer',
                      navigate: () {
                        Navigator.of(context)
                            .pushReplacementNamed(FutureUpdateScreen.routeName);
                        // .pushReplacementNamed(OnlineGameScreen.routeName);
                      },
                      height: deviceSize.height * 0.06,
                      width: deviceSize.width * 0.7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
