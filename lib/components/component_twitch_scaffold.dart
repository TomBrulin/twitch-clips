import 'package:flutter/material.dart';
import 'package:twitch_clips/resources/app_colors.dart';

class TwitchScaffold extends StatelessWidget {
  final Widget body;
  const TwitchScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PURPLE_900,
        shadowColor: Colors.transparent,
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.settings_outlined, color: AppColors.TEXT_COLOR)
          )
        ],
      ),
      body: body,
    );
  }
}
