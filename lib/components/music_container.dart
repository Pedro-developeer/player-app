import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:player/components/music_card.dart';
import 'package:player/components/music_image.dart';
import 'package:player/constants.dart';
import 'package:player/screens/musicPlayer/music_player.dart';
import 'package:player/services/goto.dart';

import '../config/constants/sizes.dart';
import '../manager/page_manager.dart';
import '../services/service_locator.dart';

class MusicContainer extends StatelessWidget {
  final MediaItem currentSong;
  final bool gotoNextPage;

  const MusicContainer({
    super.key,
    required this.currentSong,
    required this.gotoNextPage,
  });

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        pageManager.playSpecificSong(currentSong);
        pageManager.play();

        if (gotoNextPage) {
          FocusScope.of(context).unfocus();
          goto(context, MusicPlayer(currentSong: currentSong));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: Sizes.defaultPadding * 0.1,
          horizontal: Sizes.defaultPadding * 0.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ValueListenableBuilder<MediaItem>(
          valueListenable: pageManager.currentSongNotifier,
          builder: (_, song, __) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.defaultPadding * 0.5,
              ),
              leading: currentSong.extras!['image'] == null
                  ? const MusicCard(
                      width: 80,
                      height: double.maxFinite,
                      icon: Icons.music_note_rounded,
                      size: 40,
                      opacity: 0.0,
                    )
                  : MusicImage(image: currentSong.extras!['image']),
              title: Text(
                currentSong.title,
                overflow: TextOverflow.ellipsis,
                semanticsLabel: "song name",
                style: TextStyle(
                  color: song == currentSong
                      ? Constants.colorPrimaryGreen
                      : Constants.colorPrimaryWhite,
                ),
              ),
              subtitle: Text(
                currentSong.artist ?? "",
                semanticsLabel: "artist name",
                style: TextStyle(
                  color: Constants.colorPrimaryWhite,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
