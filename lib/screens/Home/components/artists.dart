import 'package:flutter/material.dart';

import 'package:player/config/constants/sizes.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/services/service_locator.dart';
import 'package:player/services/songs_provider.dart';

class Artists extends StatelessWidget {
  const Artists({super.key});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    Songs().getSongsByArtist();

    return Padding(
      padding: const EdgeInsets.only(top: Sizes.defaultPadding * 2),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                ),
                Text('artistName')
              ],
            ),
          ),
          Card(
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                ),
                Text('artistName')
              ],
            ),
          ),
          Card(
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                ),
                Text('artistName')
              ],
            ),
          ),
          Card(
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                ),
                Text('artistName')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
