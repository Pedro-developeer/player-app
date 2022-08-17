import 'package:flutter/material.dart';
import 'package:player/constants.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/notifiers/progressbar_notifier.dart';
import 'package:player/services/service_locator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:progresso/progresso.dart';

class MusicSlider extends StatefulWidget {
  const MusicSlider({Key? key}) : super(key: key);

  @override
  State<MusicSlider> createState() => _MusicSliderState();
}

class _MusicSliderState extends State<MusicSlider> {
  final pageManager = getIt<PageManager>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, dynamic progressVal, __) {
        return SleekCircularSlider(
          appearance: CircularSliderAppearance(
            customWidths: CustomSliderWidths(
              progressBarWidth: 10,
              trackWidth: 10,
              shadowWidth: 10,
              handlerSize: 10,
            ),
            customColors: CustomSliderColors(
              progressBarColor: Constants.colorPrimaryGreen,
              trackColor: Constants.colorPrimaryGreenDark,
              dotColor: Constants.colorPrimaryWhite,
              shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shadowStep: 10,
            ),
            size: double.maxFinite,
          ),
          min: 0.0,
          initialValue: progressVal.current.inSeconds.toDouble(),
          max: progressVal.total.inSeconds.toDouble(),
          onChange: (double value) {
            setState(() {
              Duration position = Duration(seconds: value.toInt());
              pageManager.seek(position);
            });
          },
        );
      },
    );
  }
}
