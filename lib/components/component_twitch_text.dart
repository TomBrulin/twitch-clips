import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitch_clips/resources/app_colors.dart';

class TwitchText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  const TwitchText(this.text, {Key? key, this.size = 10, this.color = AppColors.TEXT_COLOR, this.margin = EdgeInsets.zero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: Text(
        text,
        style: GoogleFonts.baloo2(
          textStyle: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: FontWeight.w600
          )
        )
      ),
    );
  }
}
