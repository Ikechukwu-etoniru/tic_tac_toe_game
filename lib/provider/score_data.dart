import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/screen/select_difficulty_screen.dart';

class ScoreData with ChangeNotifier {
  final List<int> _easyPlayerList = [];
  final List<int> _mediumPlayerList = [];
  final List<int> _hardPlayerList = [];
  final List<int> _easyComputerList = [];
  final List<int> _mediumComputerList = [];
  final List<int> _hardComputerList = [];
  final List<int> _player1List = [];
  final List<int> _player2List = [];

  void playerAdd(int value, Difficulty difficulty) {
    if (difficulty == Difficulty.easy) {
      _easyPlayerList.add(value);
    } else if (difficulty == Difficulty.medium) {
      _mediumPlayerList.add(value);
    } else if (difficulty == Difficulty.hard) {
      _hardPlayerList.add(value);
    }
    notifyListeners();
  }

  void addWinToDb(int value, Difficulty difficulty) async {
    final db = await SharedPreferences.getInstance();
    if (difficulty == Difficulty.easy) {
      if (!db.containsKey('easyWin')) {
        db.setInt('easyWin', 1);
      } else {
        final oldScore = db.getInt('easyWin');
        await db.remove('easyWin');
        await db.setInt('easyWin', oldScore! + 1);
      }
    } else if (difficulty == Difficulty.medium) {
      if (!db.containsKey('mediumWin')) {
        db.setInt('mediumWin', 1);
      } else {
        final oldScore = db.getInt('mediumWin');
        await db.remove('mediumWin');
        await db.setInt('mediumWin', oldScore! + 1);
      }
    } else if (difficulty == Difficulty.hard) {
      if (!db.containsKey('hardWin')) {
        db.setInt('hardWin', 1);
      } else {
        final oldScore = db.getInt('hardWin');
        await db.remove('hardWin');
        await db.setInt('hardWin', oldScore! + 1);
      }
    }
  }

  void addLossToDb(int value, Difficulty difficulty) async {
    final db = await SharedPreferences.getInstance();
    if (difficulty == Difficulty.easy) {
      if (!db.containsKey('easyLoss')) {
        db.setInt('easyLoss', 1);
      } else {
        final oldScore = db.getInt('easyLoss');
        await db.remove('easyLoss');
        await db.setInt('easyLoss', oldScore! + 1);
      }
    } else if (difficulty == Difficulty.medium) {
      if (!db.containsKey('mediumLoss')) {
        db.setInt('mediumLoss', 1);
      } else {
        final oldScore = db.getInt('mediumLoss');
        await db.remove('mediumLoss');
        await db.setInt('mediumLoss', oldScore! + 1);
      }
    } else if (difficulty == Difficulty.hard) {
      if (!db.containsKey('hardLoss')) {
        db.setInt('hardLoss', 1);
      } else {
        final oldScore = db.getInt('hardLoss');
        await db.remove('hardLoss');
        await db.setInt('hardLoss', oldScore! + 1);
      }
    }
  }

  void addDrawToDb(int value, Difficulty difficulty) async {
    final db = await SharedPreferences.getInstance();
    if (difficulty == Difficulty.easy) {
      if (!db.containsKey('easyDraw')) {
        db.setInt('easyDraw', 1);
      } else {
        final oldScore = db.getInt('easyDraw');
        await db.remove('easyDraw');
        await db.setInt('easyDraw', oldScore! + 1);
      }
    } else if (difficulty == Difficulty.medium) {
      if (!db.containsKey('mediumDraw')) {
        db.setInt('mediumDraw', 1);
      } else {
        final oldScore = db.getInt('mediumDraw');
        await db.remove('mediumDraw');
        await db.setInt('mediumDraw', oldScore! + 1);
      }
    } else if (difficulty == Difficulty.hard) {
      if (!db.containsKey('hardDraw')) {
        db.setInt('hardDraw', 1);
      } else {
        final oldScore = db.getInt('hardDraw');
        await db.remove('hardDraw');
        await db.setInt('hardDraw', oldScore! + 1);
      }
    }
  }

  void multiPlayerAdd(int value) {
    if (value == 1) {
      _player1List.add(value);
    } else if (value == 2) {
      _player2List.add(value);
    }
    notifyListeners();
  }

  void computerAdd(int value, Difficulty difficulty) {
    if (difficulty == Difficulty.easy) {
      _easyComputerList.add(value);
    } else if (difficulty == Difficulty.medium) {
      _mediumComputerList.add(value);
    } else if (difficulty == Difficulty.hard) {
      _hardComputerList.add(value);
    }
    notifyListeners();
  }

  void scoreEmpty() {
    _easyPlayerList.clear();
    _mediumPlayerList.clear();
    _hardComputerList.clear();
    _easyComputerList.clear();
    _mediumComputerList.clear();
    _hardComputerList.clear();
    notifyListeners();
  }

  void multiPlayerScoreEmpty() {
    _player1List.clear();
    _player2List.clear();
    notifyListeners();
  }

  int get player1Score {
    return _player1List.length;
  }

  int get player2Score {
    return _player2List.length;
  }

  int getPlayerScore(Difficulty difficulty) {
    if (difficulty == Difficulty.easy) {
      return _easyPlayerList.length;
    } else if (difficulty == Difficulty.medium) {
      return _mediumPlayerList.length;
    } else {
      return _hardPlayerList.length;
    }
  }

  int getComputerScore(Difficulty difficulty) {
    if (difficulty == Difficulty.easy) {
      return _easyComputerList.length;
    } else if (difficulty == Difficulty.medium) {
      return _mediumComputerList.length;
    } else {
      return _hardComputerList.length;
    }
  }

  //
}
