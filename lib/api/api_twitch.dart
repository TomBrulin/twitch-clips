import 'dart:convert';
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2/oauth2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:twitch_clips/models/twitch_clip.dart';
import 'package:http/http.dart' as http;

import '../models/twitch_game.dart';

class ApiTwitch {

  final Uri authorizationEndpoint = Uri.parse('https://id.twitch.tv/oauth2/authorize');
  final Uri tokenEndpoint = Uri.parse('https://id.twitch.tv/oauth2/token');
  final String identifier = dotenv.env["TWITCH_CLIENT_ID"]!;
  final String secret = dotenv.env["TWITCH_APP_SECRET"]!;
  final Uri redirectUrl = Uri.parse("http://localhost");

  Future<oauth2.Client> createClient() async {
    var file = await credentialsFile;
    var exists = await file.exists();

    if (exists) {
      var credentials = oauth2.Credentials.fromJson(await file.readAsString());
      return oauth2.Client(credentials, identifier: identifier, secret: secret);
    }

    var client = await oauth2.clientCredentialsGrant(tokenEndpoint, identifier, secret, basicAuth: false);
    if (!exists) {
      file.create(
        recursive: true
      );
    }
    await file.writeAsString(client.credentials.toJson());

    return client;
  }

  Future<List<TwitchGame>> getGames() async {
    List<TwitchGame> games = [];

    oauth2.Client client = await createClient();

    var request = http.Request(
      "GET",
      Uri.parse('https://api.twitch.tv/helix/games/top?first=100'),
    );
    request.headers['Client-Id'] = identifier;

    var response = await client.send(request);
    Map<String, dynamic> json = jsonDecode(await response.stream.bytesToString());

    for (var game in json["data"]) {
      games.add(
        TwitchGame(
          id: game["id"],
          name: game["name"],
          boxArtUrl: game["box_art_url"]
        )
      );
    }

    return games;
  }

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get credentialsFile async {
    final path = await localPath;
    return File('$path/twitch-clips/credentials.json');
  }

}