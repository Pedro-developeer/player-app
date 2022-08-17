import 'package:flutter/material.dart';
import 'package:player/constants.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    Key? key,
    required this.title,
    required this.artist,
    required this.size,
    required this.fontSize,
    required this.color,
  }) : super(key: key);
  final String title;
  final String artist;
  final double size;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            // ignore: sort_child_properties_last
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Constants.colorPrimaryWhite,
                  fontSize: 15),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: height * size),
        SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Text(
              artist,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Constants.colorPrimaryWhite,
                fontSize: 12,
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
