import 'package:flutter/material.dart';

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

  

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return  Scaffold(
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
                          Navigator.of(context).pushReplacementNamed(
                              SelectDifficultyScreen.routeName);
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
                              .pushReplacementNamed(SelectNameScreen.routeName);
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
        );
      }
    
  }

