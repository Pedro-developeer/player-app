import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:player/constants.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/notifiers/play_button_notifier.dart';
import 'package:player/screens/musicPlayer/components/music_description.dart';
import 'package:player/services/service_locator.dart';
import '../../config/constants/sizes.dart';
import 'components/music_controller.dart';
import 'components/music_image_cover.dart';

class MusicPlayer extends StatefulWidget {
  final MediaItem currentSong;
  const MusicPlayer({super.key, required this.currentSong});

  @override
  MusicPlayerState createState() => MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer> {
  final pageManager = getIt<PageManager>();

  @override
  void initState() {
    super.initState();

    pageManager.playSpecificSong(widget.currentSong);
    pageManager.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colorBackGround,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultPadding),
          child: ValueListenableBuilder<MediaItem>(
            valueListenable: pageManager.currentSongNotifier,
            builder: (_, song, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: MusicImageCover(
                      title: song.title,
                      image: song.extras?['image'],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MusicDescription(currentSong: song),
                  ),
                  const MusicController()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.colorBackGround,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.chevron_left_rounded,
            size: Theme.of(context).iconTheme.size,
            color: Constants.colorPrimaryWhite),
      ),
      title: musicTitle(),
      centerTitle: true,
    );
  }

  Widget musicTitle() {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, buttonState, __) {
        return Text(
          buttonState == ButtonState.paused ? 'Stopped' : 'Playing now',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,
          ),
        );
      },
    );
  }
}
