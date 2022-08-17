import 'package:flutter/material.dart';
import 'package:player/constants.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback press;
  final bool buttonState;
  const PlayButton({Key? key, required this.press, required this.buttonState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.colorPrimaryGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 50,
      height: 50,
      child: IconButton(
        icon: Icon(
          buttonState ? Icons.pause : Icons.play_arrow,
          color: Constants.colorSecundaryBlack,
        ),
        onPressed: press,
      ),
    );
  }
}
