import 'package:flutter/material.dart';
import 'package:twitch_clips/api/api_twitch.dart';
import 'package:twitch_clips/models/device_info.dart';
import 'package:twitch_clips/models/twitch_game.dart';

class GameDisplay extends StatefulWidget {
  const GameDisplay({Key? key}) : super(key: key);

  @override
  _GameDisplayState createState() => _GameDisplayState();
}

class _GameDisplayState extends State<GameDisplay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: getGamesFutureBuilder(),
      )
    );
  }

  FutureBuilder<List<TwitchGame>> getGamesFutureBuilder() {
    return FutureBuilder<List<TwitchGame>>(
      future: ApiTwitch().getGames(),
      builder: (BuildContext context, AsyncSnapshot<List<TwitchGame>> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        } else if (snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            print(snapshot.error);
            return Text("Error");
          } else if (snapshot.hasData) {
            return getGamesDisplay(snapshot.data!);
          } else {
            return Text("No Data");
          }
        } else {
          return Text("State : ${snapshot.connectionState}");
        }
      },
    );
  }

  Widget getGamesDisplay(List<TwitchGame> data) {
    int imgWidth = ((DeviceInfo.deviceSize!.width - 16) / 2).round();
    int imgHeight = (imgWidth * 1.34).round();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: imgWidth/imgHeight,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8
      ),
      itemBuilder: (_, index) {
        return InkWell(
          child: SizedBox(
            width: imgWidth.toDouble(),
            height: imgHeight.toDouble(),
            //color: Colors.grey,
            //margin: EdgeInsets.only(top: 16, bottom: 16, right: 4, left: 4),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          data[index].boxArtUrl!.replaceAll("{width}", "$imgWidth").replaceAll("{height}", "$imgHeight")
                      )
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
          ),
          onTap: null
        );
      },
      itemCount: data.length,
    );
  }
}
