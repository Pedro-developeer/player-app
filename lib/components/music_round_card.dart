import 'package:flutter/material.dart';

import 'package:player/config/constants/sizes.dart';
import 'package:player/constants.dart';
import 'package:player/manager/page_manager.dart';

import 'package:player/services/service_locator.dart';

class RoundedMusicCard extends StatelessWidget {
  const RoundedMusicCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.all(Sizes.defaultPadding),
      child: CircleAvatar(
        backgroundColor: Constants.colorPrimaryGreen,
        child: Icon(
          Icons.music_note_rounded,
          color: Constants.colorSecundaryBlack,
          size: 200,
        ),
      ),
    );
  }
}
