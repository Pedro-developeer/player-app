import 'package:flutter/material.dart';
import 'package:player/config/constants/sizes.dart';
import 'package:player/constants.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.width,
    required this.size,
    required this.opacity,
    required this.height,
    required this.icon,
  });

  final double width;
  final double height;
  final double size;
  final double opacity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(Sizes.defaultBorderRaduis)),
      ),
      child: Icon(
        icon,
        color: Constants.colorPrimaryGreen,
        size: size,
      ),
    );
  }
}
