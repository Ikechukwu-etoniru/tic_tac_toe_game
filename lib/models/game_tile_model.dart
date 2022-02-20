import 'package:flutter/material.dart';



class GameTileModel {
  int id;
  Color color;
  String text;
  bool isEnabled;

  GameTileModel(
      {required this.id,
      this.color = Colors.blueGrey,
      this.isEnabled = false,
      this.text = ''});
}
