import 'package:flutter/material.dart';
import 'package:tic_toe_game/screen/app_drawer.dart';
import 'package:tic_toe_game/utils/colors.dart';

class FutureUpdateScreen extends StatelessWidget {
  static const routeName = '/future_update_screen.dart';
  const FutureUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'images/update.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'This feature will be added in the next update',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30 ),
            )
          ],
        ),
      ),
    );
  }
}
