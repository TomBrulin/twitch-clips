class TwitchGame {
  String? id;
  String? name;
  String? boxArtUrl;

  TwitchGame({this.id, this.name, this.boxArtUrl});

  TwitchGame.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    boxArtUrl = json['box_art_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['box_art_url'] = boxArtUrl;
    return data;
  }
}
