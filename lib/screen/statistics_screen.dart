import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_toe_game/screen/app_drawer.dart';
import 'package:tic_toe_game/utils/colors.dart';

class StatisticsScreen extends StatefulWidget {
  static const routeName = '/statistics_screen.dart';
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getAllRecord();
  }

  Future _getAllRecord() async {
    setState(() {
      _isLoading = true;
    });
    final db = await SharedPreferences.getInstance();
    easyWin = db.getInt('easyWin');
    easyDraw = db.getInt('easyDraw');
    easyLoss = db.getInt('easyLoss');

    mediumDraw = db.getInt('mediumDraw');
    mediumLoss = db.getInt('mediumLoss');
    mediumWin = db.getInt('mediumWin');

    hardDraw = db.getInt('hardDraw');
    hardLoss = db.getInt('hardLoss');
    hardWin = db.getInt('hardWin');

    setState(() {
      _isLoading = false;
    });
  }

  late int? easyWin;
  late int? easyDraw;
  late int? easyLoss;

  late int? mediumWin;
  late int? mediumDraw;
  late int? mediumLoss;

  late int? hardWin;
  late int? hardDraw;
  late int? hardLoss;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: MyColors.lightModeScaffoldColor,
              ),
            ),
          )
        : Scaffold(
            drawer: const AppDrawer(),
            appBar: AppBar(
              title: const Text('Records'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GameRecordRow(
                      image: 'images/easy_pic.png',
                      difficulty: 'Easy',
                      drawRecord: easyDraw == null ? '0' : easyDraw.toString(),
                      lossRecord: easyLoss == null ? '0' : easyLoss.toString(),
                      winRecord: easyWin == null ? '0' : easyWin.toString()),
                  const SizedBox(
                    height: 25,
                  ),
                  GameRecordRow(
                      image: 'images/medium_pic.png',
                      difficulty: 'Medium',
                      drawRecord:
                          mediumDraw == null ? '0' : mediumDraw.toString(),
                      lossRecord:
                          mediumLoss == null ? '0' : mediumLoss.toString(),
                      winRecord:
                          mediumWin == null ? '0' : mediumWin.toString()),
                  const SizedBox(
                    height: 25,
                  ),
                  GameRecordRow(
                      image: 'images/hard_pic.png',
                      difficulty: 'Hard',
                      drawRecord: hardDraw == null ? '0' : hardDraw.toString(),
                      lossRecord: hardLoss == null ? '0' : hardLoss.toString(),
                      winRecord: hardWin == null ? '0' : hardWin.toString()),
                  const SizedBox(
                    height: 25,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      final _isAgreed = await _showClearRecordDialog(context);
                      if (_isAgreed != null && _isAgreed) {
                        final db = await SharedPreferences.getInstance();
                        db.clear();
                        Navigator.of(context)
                            .popAndPushNamed(StatisticsScreen.routeName);
                      }
                    },
                    child: Chip(
                      label: const Text('Clear record'),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

class GameRecordRow extends StatelessWidget {
  final String image;
  final String difficulty;
  final String winRecord;
  final String drawRecord;
  final String lossRecord;
  const GameRecordRow(
      {required this.image,
      required this.difficulty,
      required this.drawRecord,
      required this.lossRecord,
      required this.winRecord,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(image),
        ),
        Text(
          difficulty,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Win',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              winRecord,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 18,
              ),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Draw',
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              drawRecord,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 18,
              ),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Loss',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              lossRecord,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            )
          ],
        ),
      ],
    );
  }
}

Future<bool?> _showClearRecordDialog(BuildContext context) async {
  return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return Dialog(
          backgroundColor: MyColors.lightModeScaffoldColor,
          elevation: 30,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Are you sure you want to delete all records',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      });
}
