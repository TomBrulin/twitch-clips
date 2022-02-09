import 'package:flutter/material.dart';
import 'package:twitch_clips/components/component_twitch_gamedisplay.dart';
import 'package:twitch_clips/components/component_twitch_scaffold.dart';
import 'package:twitch_clips/components/component_twitch_selectionbar.dart';
import 'package:twitch_clips/components/component_twitch_text.dart';
import 'package:twitch_clips/components/component_twitch_titlebar.dart';
import 'package:twitch_clips/models/device_info.dart';
import 'package:twitch_clips/resources/app_colors.dart';

class PageMain extends StatefulWidget {
  List<String>? tabList;
  String? selectedTab;
  PageMain({Key? key}) : super(key: key) {
    tabList = ["Games", "Streamers"];
    selectedTab = tabList![0];
  }

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  //String? selectedTab;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceInfo.deviceSize = MediaQuery.of(context).size;

    TwitchSelectionBar selectionBar = TwitchSelectionBar(
      changeTab,
      widget.tabList!,
      baseSelection: widget.selectedTab,
    );

    return TwitchScaffold(
      body: Column(
        children: [
          TwitchTitleBar(widget.selectedTab!),
          selectionBar,
          getDisplay()
        ],
      )
    );
  }

  Widget getDisplay() {
    if(widget.selectedTab == "Games") {
      return GameDisplay();
    }
    if(widget.selectedTab == "Streamers") {
      return Text("StreamersDisplay");
    }
    return const Text("Error");
  }

  void changeTab(String tab) {
    setState(() {
      widget.selectedTab = tab;
    });
  }
}
