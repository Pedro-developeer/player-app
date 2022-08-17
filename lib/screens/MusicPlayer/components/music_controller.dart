import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/notifiers/play_button_notifier.dart';
import 'package:player/services/service_locator.dart';
import 'music_play_button.dart';

class MusicController extends ConsumerWidget {
  const MusicController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageManager = getIt<PageManager>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => pageManager.previous(),
          icon: const Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 30,
          ),
        ),
        ValueListenableBuilder<ButtonState>(
          valueListenable: pageManager.playButtonNotifier,
          builder: (_, buttonState, __) {
            return PlayButton(
              press: () {
                buttonState == ButtonState.paused
                    ? pageManager.play()
                    : pageManager.pause();
              },
              buttonState: buttonState == ButtonState.paused,
            );
          },
        ),
        IconButton(
          onPressed: () => pageManager.next(),
          icon: const Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
