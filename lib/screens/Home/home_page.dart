import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:player/components/bottom_music_controller.dart';
import 'package:player/components/custom_search_delegate.dart';
import 'package:player/constants.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/screens/Home/components/all_songs.dart';
import 'package:player/screens/Home/components/artists.dart';
import 'package:player/services/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Tab> myTabs = <Tab>[
      Tab(child: Text('All songs')),
      Tab(child: Text('Artists')),
    ];
    final pageManager = getIt<PageManager>();

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Constants.colorBackGround,
        appBar: buildAppBar(context, myTabs),
        drawerScrimColor: Constants.colorPrimaryGreen,
        body: const TabBarView(
          children: [
            AllSongs(),
            Artists(),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder<MediaItem>(
          valueListenable: pageManager.currentSongNotifier,
          builder: (_, song, __) {
            return BottomMusicController(currentSong: song);
          },
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, List<Tab> myTabs) {
    return AppBar(
      backgroundColor: Constants.colorBackGround,
      title: const Text(
        'Simple Music Player',
      ),
      actions: [
        IconButton(
          onPressed: () => showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          ),
          icon: const Icon(Icons.search_rounded),
        )
      ],
      bottom: TabBar(tabs: myTabs),
    );
  }
}
