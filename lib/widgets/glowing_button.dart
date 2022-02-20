import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final String text;
  final VoidCallback navigate;
  final double height;
  final double width;
  const GlowingButton(
      {required this.color1,
      required this.color2,
      required this.text,
      required this.navigate,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  var onTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onTap = true;
        });
        Future.delayed(const Duration(milliseconds: 80), widget.navigate)
            .then((value) {
          setState(() {
            onTap = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        padding: onTap ? const EdgeInsets.all(15) : const EdgeInsets.all(0),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [widget.color1, widget.color2],
            ),
            boxShadow: onTap
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(5, 7),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(-5, -7),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(7, 15),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(-7, -15),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ]),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold, 
                fontSize: 20,
                fontFamily: 'Quicksand'),
          ),
        ),
      ),
    );
  }
}
