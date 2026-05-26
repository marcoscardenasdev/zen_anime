import 'dart:convert';

AnimeRecommendationsResponse animeRecommendationsResponseFromJson(String str) =>
    AnimeRecommendationsResponse.fromJson(json.decode(str));

String animeRecommendationsResponseToJson(AnimeRecommendationsResponse data) =>
    json.encode(data.toJson());

class AnimeRecommendationsResponse {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final String title;

  AnimeRecommendationsResponse({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory AnimeRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      AnimeRecommendationsResponse(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(
          json["images"],
        ).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "url": url,
    "images": Map.from(
      images,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "title": title,
  };
}

class Image {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    imageUrl: json["image_url"],
    smallImageUrl: json["small_image_url"],
    largeImageUrl: json["large_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "small_image_url": smallImageUrl,
    "large_image_url": largeImageUrl,
  };
}
