import 'package:flutter/material.dart';
import 'package:twitch_clips/components/component_twitch_text.dart';
import 'package:twitch_clips/models/device_info.dart';
import 'package:twitch_clips/resources/app_colors.dart';

class TwitchSelectionBar extends StatefulWidget {
  final List<String> content;
  String? selectedTab;
  TwitchSelectionBar(this.content, {Key? key}) : super(key: key);

  @override
  _TwitchSelectionBarState createState() => _TwitchSelectionBarState();
}

class _TwitchSelectionBarState extends State<TwitchSelectionBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceInfo.deviceSize!.width,
      height: 40,
      child: Row(
        children: getTabs(),
      )
    );
  }

  List<InkWell> getTabs() {
    List<InkWell> tabs = [];
    for (var element in widget.content) {
      tabs.add(InkWell(
        child: Container(
          color: getTabColor(element),
          width: DeviceInfo.deviceSize!.width/widget.content.length,
          child: Center(
            child: TwitchText(
              element,
              size: 16
            ),
          )
        ),
        onTap: () {
          setState(() {
            widget.selectedTab = element;
          });
        }
      ));
    }
    return tabs;
  }

  Color getTabColor(String tab) {
    if(widget.selectedTab == null || widget.selectedTab != tab) {
      return AppColors.PURPLE_900;
    } else {
      return AppColors.PURPLE_600;
    }
  }
}