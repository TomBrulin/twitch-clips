class TwitchClip {
  String? id;
  String? url;
  String? embedUrl;
  String? broadcasterId;
  String? broadcasterName;
  String? creatorId;
  String? creatorName;
  String? videoId;
  String? gameId;
  String? language;
  String? title;
  int? viewCount;
  String? createdAt;
  String? thumbnailUrl;
  double? duration;

  TwitchClip(
      {this.id,
        this.url,
        this.embedUrl,
        this.broadcasterId,
        this.broadcasterName,
        this.creatorId,
        this.creatorName,
        this.videoId,
        this.gameId,
        this.language,
        this.title,
        this.viewCount,
        this.createdAt,
        this.thumbnailUrl,
        this.duration});

  TwitchClip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    embedUrl = json['embed_url'];
    broadcasterId = json['broadcaster_id'];
    broadcasterName = json['broadcaster_name'];
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    videoId = json['video_id'];
    gameId = json['game_id'];
    language = json['language'];
    title = json['title'];
    viewCount = json['view_count'];
    createdAt = json['created_at'];
    thumbnailUrl = json['thumbnail_url'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['embed_url'] = embedUrl;
    data['broadcaster_id'] = broadcasterId;
    data['broadcaster_name'] = broadcasterName;
    data['creator_id'] = creatorId;
    data['creator_name'] = creatorName;
    data['video_id'] = videoId;
    data['game_id'] = gameId;
    data['language'] = language;
    data['title'] = title;
    data['view_count'] = viewCount;
    data['created_at'] = createdAt;
    data['thumbnail_url'] = thumbnailUrl;
    data['duration'] = duration;
    return data;
  }
}