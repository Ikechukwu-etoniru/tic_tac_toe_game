import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tic_toe_game/screen/statistics_screen.dart';
import 'package:tic_toe_game/utils/colors.dart';
import 'package:tic_toe_game/utils/text.dart';

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
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
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
            onTap: () {
              Navigator.of(context).pushNamed(StatisticsScreen.routeName);
            },
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
            onTap: () {
              Share.share(TextHelper.appUrl);
            },
            title: const Text(
              'Share App',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            trailing: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              SystemNavigator.pop();
            },
            title: const Text(
              'Close App',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            trailing: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
