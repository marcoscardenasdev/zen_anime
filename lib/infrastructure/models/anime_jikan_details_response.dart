import 'dart:convert';

AnimeDetailsResponse animeDetailsResponseFromJson(String str) =>
    AnimeDetailsResponse.fromJson(json.decode(str));

String animeDetailsResponseToJson(AnimeDetailsResponse data) =>
    json.encode(data.toJson());

class AnimeDetailsResponse {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final Trailer trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final List<dynamic> titleSynonyms;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  final Aired aired;
  final String duration;
  final String rating;
  final double score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String background;
  final String season;
  final int year;
  //final Broadcast broadcast;
  final List<Genre> producers;
  final List<Genre> licensors;
  final List<Genre> studios;
  final List<Genre> genres;
  final List<dynamic> explicitGenres;
  final List<Genre> themes;
  final List<dynamic> demographics;
  // final List<Relation> relations;

  AnimeDetailsResponse({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    // required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
    // required this.relations,
  });

  factory AnimeDetailsResponse.fromJson(
    Map<String, dynamic> json,
  ) => AnimeDetailsResponse(
    malId: json["mal_id"],
    url: json["url"],
    images: Map.from(
      json["images"],
    ).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
    trailer: Trailer.fromJson(json["trailer"]),
    approved: json["approved"],
    titles: List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
    title: json["title"],
    titleEnglish: json["title_english"],
    titleJapanese: json["title_japanese"],
    titleSynonyms: List<dynamic>.from(json["title_synonyms"].map((x) => x)),
    type: json["type"],
    source: json["source"],
    episodes: json["episodes"],
    status: json["status"],
    airing: json["airing"],
    aired: Aired.fromJson(json["aired"]),
    duration: json["duration"],
    rating: json["rating"],
    score: json["score"]?.toDouble(),
    scoredBy: json["scored_by"],
    rank: json["rank"],
    popularity: json["popularity"],
    members: json["members"],
    favorites: json["favorites"],
    synopsis: json["synopsis"],
    background: json["background"],
    season: json["season"] ?? 'no-season',
    year: json["year"] ?? DateTime.now().year,
    //broadcast: Broadcast.fromJson(json["broadcast"]),
    producers: List<Genre>.from(
      json["producers"].map((x) => Genre.fromJson(x)),
    ),
    licensors: List<Genre>.from(
      json["licensors"].map((x) => Genre.fromJson(x)),
    ),
    studios: List<Genre>.from(json["studios"].map((x) => Genre.fromJson(x))),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    explicitGenres: List<dynamic>.from(json["explicit_genres"].map((x) => x)),
    themes: List<Genre>.from(json["themes"].map((x) => Genre.fromJson(x))),
    demographics: List<dynamic>.from(json["demographics"].map((x) => x)),
    // relations:
    // List<Relation>.from(
    //   json["relations"].map((x) => Relation.fromJson(x)),
    // ),
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "url": url,
    "images": Map.from(
      images,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "trailer": trailer.toJson(),
    "approved": approved,
    "titles": List<dynamic>.from(titles.map((x) => x.toJson())),
    "title": title,
    "title_english": titleEnglish,
    "title_japanese": titleJapanese,
    "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
    "type": type,
    "source": source,
    "episodes": episodes,
    "status": status,
    "airing": airing,
    "aired": aired.toJson(),
    "duration": duration,
    "rating": rating,
    "score": score,
    "scored_by": scoredBy,
    "rank": rank,
    "popularity": popularity,
    "members": members,
    "favorites": favorites,
    "synopsis": synopsis,
    "background": background,
    "season": season,
    "year": year,
    //"broadcast": broadcast.toJson(),
    "producers": List<dynamic>.from(producers.map((x) => x.toJson())),
    "licensors": List<dynamic>.from(licensors.map((x) => x.toJson())),
    "studios": List<dynamic>.from(studios.map((x) => x.toJson())),
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "explicit_genres": List<dynamic>.from(explicitGenres.map((x) => x)),
    "themes": List<dynamic>.from(themes.map((x) => x.toJson())),
    "demographics": List<dynamic>.from(demographics.map((x) => x)),
    // "relations": List<dynamic>.from(relations.map((x) => x.toJson())),
  };
}

class Aired {
  final DateTime from;
  final DateTime to;
  final Prop prop;
  final String string;

  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
    from: DateTime.parse(json["from"]),
    to: json["to"] == null ? DateTime.now() : DateTime.parse(json["to"]),
    prop: Prop.fromJson(json["prop"]),
    string: json["string"],
  );

  Map<String, dynamic> toJson() => {
    "from": from.toIso8601String(),
    "to": to.toIso8601String(),
    "prop": prop.toJson(),
    "string": string,
  };
}

class Prop {
  final From from;
  final From to;

  Prop({required this.from, required this.to});

  factory Prop.fromJson(Map<String, dynamic> json) =>
      Prop(from: From.fromJson(json["from"]), to: From.fromJson(json["to"]));

  Map<String, dynamic> toJson() => {"from": from.toJson(), "to": to.toJson()};
}

class From {
  final int day;
  final int month;
  final int year;

  From({required this.day, required this.month, required this.year});

  factory From.fromJson(Map<String, dynamic> json) => From(
    day: json["day"] ?? DateTime.now().day,
    month: json["month"] ?? DateTime.now().month,
    year: json["year"] ?? DateTime.now().year,
  );

  Map<String, dynamic> toJson() => {"day": day, "month": month, "year": year};
}

class External {
  final String name;
  final String url;

  External({required this.name, required this.url});

  factory External.fromJson(Map<String, dynamic> json) =>
      External(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Genre {
  final int malId;
  final Type type;
  final String name;
  final String url;

  Genre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    malId: json["mal_id"],
    type: typeValues.map[json["type"]]!,
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "type": typeValues.reverse[type],
    "name": name,
    "url": url,
  };
}

enum Type { ANIME, MANGA }

final typeValues = EnumValues({"anime": Type.ANIME, "manga": Type.MANGA});

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

class Relation {
  final String relation;
  final List<Genre> entry;

  Relation({required this.relation, required this.entry});

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
    relation: json["relation"],
    entry: List<Genre>.from(json["entry"].map((x) => Genre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "relation": relation,
    "entry": List<dynamic>.from(entry.map((x) => x.toJson())),
  };
}

class Title {
  final String type;
  final String title;

  Title({required this.type, required this.title});

  factory Title.fromJson(Map<String, dynamic> json) =>
      Title(type: json["type"], title: json["title"]);

  Map<String, dynamic> toJson() => {"type": type, "title": title};
}

class Trailer {
  final dynamic youtubeId;
  final dynamic url;
  final String embedUrl;
  final Images images;

  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
    youtubeId: json["youtube_id"],
    url: json["url"],
    embedUrl: json["embed_url"] ?? 'not found',
    images: Images.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "youtube_id": youtubeId,
    "url": url,
    "embed_url": embedUrl,
    "images": images.toJson(),
  };
}

class Images {
  final dynamic imageUrl;
  final dynamic smallImageUrl;
  final dynamic mediumImageUrl;
  final dynamic largeImageUrl;
  final dynamic maximumImageUrl;

  Images({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.maximumImageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    imageUrl: json["image_url"],
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
    maximumImageUrl: json["maximum_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
    "maximum_image_url": maximumImageUrl,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
