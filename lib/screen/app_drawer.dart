import 'package:flutter/material.dart';

import '/screen/game_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 40,
      backgroundColor: GameScreen.gameColor,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            title: const Text('Game Menu'),
            trailing: const Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}
