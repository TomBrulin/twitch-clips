import 'package:flutter/material.dart';
import 'package:twitch_clips/components/component_twitch_scaffold.dart';
import 'package:twitch_clips/components/component_twitch_selectionbar.dart';
import 'package:twitch_clips/components/component_twitch_titlebar.dart';
import 'package:twitch_clips/models/device_info.dart';
import 'package:twitch_clips/resources/app_colors.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    DeviceInfo.deviceSize = MediaQuery.of(context).size;

    return TwitchScaffold(
      body: Column(
        children: [
          TwitchTitleBar("ALEXCLICK"),
          TwitchSelectionBar(["Games", "Streamers"])
        ],
      )
    );
  }
}
