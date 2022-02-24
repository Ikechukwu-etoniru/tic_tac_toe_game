import 'package:flutter/material.dart';

class PlayerContainer extends StatelessWidget {
  final double height;
  final Color color;
  final String text;
  final String imageName;
  final String imageNamePlayer;
  const PlayerContainer(
      {required this.height,
      required this.color,
      required this.text,
      required this.imageName,
      required this.imageNamePlayer,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xff6c44d4).withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.yellowAccent, width: 0.4),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.04),
          CircleAvatar(
            radius: (height * 0.4) / 2,
            backgroundColor: color,
            child: SizedBox(
              height: height * 0.3,
              child: Image.asset(
                imageNamePlayer,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            height: height * 0.14,
            child: FittedBox(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand'),
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            height: height * 0.23,
            width: height * 0.28,
            child: Image.asset(
              imageName,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}