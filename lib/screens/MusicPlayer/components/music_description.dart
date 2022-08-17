import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/sizes.dart';

class MusicDescription extends StatelessWidget {
  final MediaItem currentSong;
  const MusicDescription({super.key, required this.currentSong});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
            currentSong.title,
          ),
        ),
        const SizedBox(height: Sizes.defaultPadding),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            currentSong.artist ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
