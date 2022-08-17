import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:player/components/music_container.dart';
import 'package:player/config/constants/sizes.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/services/service_locator.dart';

class AllSongs extends StatelessWidget {
  const AllSongs({super.key});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return Padding(
      padding: const EdgeInsets.only(top: Sizes.defaultPadding * 2),
      child: ValueListenableBuilder<List<MediaItem>>(
        valueListenable: pageManager.playlistNotifier,
        builder: (_, playlist, __) {
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              return MusicContainer(
                currentSong: playlist[index],
                gotoNextPage: false,
              );
            },
          );
        },
      ),
    );
  }
}
