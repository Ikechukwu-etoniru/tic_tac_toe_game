import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/screen/game_screen.dart';

class SelectNameScreen extends StatelessWidget {
  static const routeName = '/select_name_screen.dart';
  const SelectNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: GameScreen.gameColor,
        drawer: const AppDrawer(),
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: deviceHeight * 0.08,
            ),
            SizedBox(
              height: deviceHeight * 0.03,
              child: const FittedBox(
                child: Text(
                  'Player 1',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.05,
              width: deviceWidth * 0.9,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            )
          ],
        ));
  }
}
