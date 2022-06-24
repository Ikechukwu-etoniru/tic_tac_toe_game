import 'package:flutter/material.dart';
import 'package:tic_toe_game/utils/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 40,
      backgroundColor: MyColors.darkModeScaffoldColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.pink,
                Colors.purple,
                Colors.yellow,
                Colors.orange,
                Colors.cyan,
                Colors.green
              ]),
            ),
            alignment: Alignment.bottomLeft,
            child: const CircleAvatar(
              backgroundImage: AssetImage('images/tic_game_logo.png'),
              radius: 50,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            title: const Text(
              'Main Menu',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            trailing: const Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'Statistics',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            trailing: const Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'Share',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            trailing: const Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'Sound Settings',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            trailing: const Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
