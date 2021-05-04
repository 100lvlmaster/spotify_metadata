library spotify_metadata;

import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyApi {
  ///
  /// Get data from a youtube link
  static Future<SpotifyMetadata> getData(String link) async {
    final Uri uri = Uri.parse("https://open.spotify.com/oembed?url=$link");

    http.Response result;
    try {
      result = await http.get(uri);
    } catch (e) {
      throw 'Incorrect link';
    }
    return SpotifyMetadata.fromMap(json.decode(result.body));
  }
}

/// Model to deserialize json response
class SpotifyMetadata {
  SpotifyMetadata({
    required this.html,
    required this.width,
    required this.height,
    required this.version,
    required this.providerName,
    required this.providerUrl,
    required this.type,
    required this.title,
    required this.thumbnailUrl,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
  });

  final String html;
  final int width;
  final int height;
  final String version;
  final String providerName;
  final String providerUrl;
  final String type;
  final String title;
  final String thumbnailUrl;
  final int thumbnailWidth;
  final int thumbnailHeight;

  factory SpotifyMetadata.fromJson(String str) =>
      SpotifyMetadata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpotifyMetadata.fromMap(Map<String, dynamic> json) => SpotifyMetadata(
        html: json["html"] == null ? null : json["html"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        version: json["version"] == null ? null : json["version"],
        providerName:
            json["provider_name"] == null ? null : json["provider_name"],
        providerUrl: json["provider_url"] == null ? null : json["provider_url"],
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        thumbnailUrl:
            json["thumbnail_url"] == null ? null : json["thumbnail_url"],
        thumbnailWidth:
            json["thumbnail_width"] == null ? null : json["thumbnail_width"],
        thumbnailHeight:
            json["thumbnail_height"] == null ? null : json["thumbnail_height"],
      );

  Map<String, dynamic> toMap() => {
        "html": html,
        "width": width,
        "height": height,
        "version": version,
        "provider_name": providerName,
        "provider_url": providerUrl,
        "type": type,
        "title": title,
        "thumbnail_url": thumbnailUrl,
        "thumbnail_width": thumbnailWidth,
        "thumbnail_height": thumbnailHeight,
      };
}
