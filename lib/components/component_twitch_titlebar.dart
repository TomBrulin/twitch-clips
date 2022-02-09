import 'package:flutter/material.dart';
import 'package:twitch_clips/components/component_twitch_text.dart';
import 'package:twitch_clips/models/device_info.dart';
import 'package:twitch_clips/resources/app_colors.dart';

class TwitchTitleBar extends StatelessWidget {
  final String text;
  const TwitchTitleBar(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.PURPLE_800,
      height: 60,
      width: DeviceInfo.deviceSize!.width,
      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: TwitchText(
        text,
        size: 26,
        margin: EdgeInsets.only(top: 8, left: 10)
      )
    );
  }
}
