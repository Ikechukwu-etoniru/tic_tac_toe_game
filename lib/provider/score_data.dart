import 'package:flutter/cupertino.dart';
import 'package:tic_toe_game/screen/select_difficulty_screen.dart';

class ScoreData with ChangeNotifier {
  final List<int> _easyPlayerList = [];
  final List<int> _mediumPlayerList = [];
  final List<int> _hardPlayerList = [];
  final List<int> _easyComputerList = [];
  final List<int> _mediumComputerList = [];
  final List<int> _hardComputerList = [];

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
