import 'dart:convert';

AnimeJikanResponse animeJikanResponseFromJson(String str) =>
    AnimeJikanResponse.fromJson(json.decode(str));

String animeJikanResponseToJson(AnimeJikanResponse data) =>
    json.encode(data.toJson());

class AnimeJikanResponse {
  final Pagination pagination;
  final List<AnimeResponse> data;

  AnimeJikanResponse({required this.pagination, required this.data});

  factory AnimeJikanResponse.fromJson(Map<String, dynamic> json) =>
      AnimeJikanResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<AnimeResponse>.from(
          json["data"].map((x) => AnimeResponse.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AnimeResponse {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final Trailer trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  // final String titleEnglish;
  // final String titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  final Aired aired;
  final String duration;
  final Rating rating;
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
  final List<Demographic> producers;
  final List<Demographic> licensors;
  final List<Demographic> studios;
  final List<Demographic> genres;
  final List<dynamic> explicitGenres;
  final List<Demographic> themes;
  final List<Demographic> demographics;

  AnimeResponse({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    // required this.titleEnglish,
    // required this.titleJapanese,
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
    //required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory AnimeResponse.fromJson(Map<String, dynamic> json) => AnimeResponse(
    malId: json["mal_id"],
    url: json["url"],
    images: Map.from(
      json["images"],
    ).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
    trailer: Trailer.fromJson(json["trailer"]),
    approved: json["approved"],
    titles: List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
    title: json["title"],
    // titleJapanese: json["title_japanese"],
    titleSynonyms: List<String>.from(json["title_synonyms"].map((x) => x)),
    type: json["type"],
    source: json["source"],
    episodes: json["episodes"] ?? 0,
    status: json["status"],
    airing: json["airing"],
    aired: Aired.fromJson(json["aired"]),
    duration: json["duration"],
    rating: ratingValues.map[json["rating"]]!,
    score: json["score"] == null ? 0 : json["score"].toDouble(),
    scoredBy: json["scored_by"] ?? 0,
    rank: json["rank"] ?? 0,
    popularity: json["popularity"],
    members: json["members"],
    favorites: json["favorites"],
    synopsis: json["synopsis"],
    background: json["background"],
    season: json["season"] ?? Season.SPRING.toString(),
    year: json["year"] ?? 0,
    //broadcast: Broadcast.fromJson(json["broadcast"]),
    producers: List<Demographic>.from(
      json["producers"].map((x) => Demographic.fromJson(x)),
    ),
    licensors: List<Demographic>.from(
      json["licensors"].map((x) => Demographic.fromJson(x)),
    ),
    studios: List<Demographic>.from(
      json["studios"].map((x) => Demographic.fromJson(x)),
    ),
    genres: List<Demographic>.from(
      json["genres"].map((x) => Demographic.fromJson(x)),
    ),
    explicitGenres: List<dynamic>.from(json["explicit_genres"].map((x) => x)),
    themes: List<Demographic>.from(
      json["themes"].map((x) => Demographic.fromJson(x)),
    ),
    demographics: List<Demographic>.from(
      json["demographics"].map((x) => Demographic.fromJson(x)),
    ),
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
    // "title_english": titleEnglish,
    // "title_japanese": titleJapanese,
    "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
    "type": type,
    "source": source,
    "episodes": episodes,
    "status": status,
    "airing": airing,
    "aired": aired.toJson(),
    "duration": duration,
    "rating": ratingValues.reverse[rating],
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
    "demographics": List<dynamic>.from(demographics.map((x) => x.toJson())),
  };
}

class Aired {
  final DateTime from;
  final DateTime? to;
  final Prop prop;
  final String string;

  Aired({
    required this.from,
    this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
    from: json["from"] == null ? DateTime.now() : DateTime.parse(json["from"]),

    to: json["to"] == null ? DateTime.now() : DateTime.parse(json["to"]),
    prop: Prop.fromJson(json["prop"]),
    string: json["string"],
  );

  Map<String, dynamic> toJson() => {
    "from": from.toIso8601String(),
    "to": to!.toIso8601String(),
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

  factory From.fromJson(Map<String, dynamic> json) =>
      json["day"] == null || json["day"] == null || json["day"] == null
      ? From(
          day: DateTime.now().day,
          month: DateTime.now().month,
          year: DateTime.now().year,
        )
      : From(day: json["day"], month: json["month"], year: json["year"]);

  Map<String, dynamic> toJson() => {"day": day, "month": month, "year": year};
}

// class Broadcast {
//   final String day;
//   final String time;
//   final Timezone timezone;
//   final String string;

//   Broadcast({
//     required this.day,
//     required this.time,
//     required this.timezone,
//     required this.string,
//   });

//   factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
//     day: json["day"],
//     time: json["time"],
//     timezone: timezoneValues.map[json["timezone"]]!,
//     string: json["string"],
//   );

//   Map<String, dynamic> toJson() => {
//     "day": day,
//     "time": time,
//     "timezone": timezoneValues.reverse[timezone],
//     "string": string,
//   };
// }

enum Timezone { ASIA_TOKYO }

final timezoneValues = EnumValues({"Asia/Tokyo": Timezone.ASIA_TOKYO});

class Demographic {
  final int malId;
  final DemographicType type;
  final String name;
  final String url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
    malId: json["mal_id"],
    type: demographicTypeValues.map[json["type"]]!,
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "type": demographicTypeValues.reverse[type],
    "name": name,
    "url": url,
  };
}

enum DemographicType { ANIME }

final demographicTypeValues = EnumValues({"anime": DemographicType.ANIME});

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

enum Rating {
  PG_13_TEENS_13_OR_OLDER,
  PG_CHILDREN,
  R_17_VIOLENCE_PROFANITY,
  R_MILD_NUDITY,
}

final ratingValues = EnumValues({
  "PG-13 - Teens 13 or older": Rating.PG_13_TEENS_13_OR_OLDER,
  "PG - Children": Rating.PG_CHILDREN,
  "R - 17+ (violence & profanity)": Rating.R_17_VIOLENCE_PROFANITY,
  "R+ - Mild Nudity": Rating.R_MILD_NUDITY,
});

enum Season { FALL, SPRING, SUMMER }

final seasonValues = EnumValues({
  "fall": Season.FALL,
  "spring": Season.SPRING,
  "summer": Season.SUMMER,
});

enum Source { LIGHT_NOVEL, MANGA, ORIGINAL }

final sourceValues = EnumValues({
  "Light novel": Source.LIGHT_NOVEL,
  "Manga": Source.MANGA,
  "Original": Source.ORIGINAL,
});

enum Status { CURRENTLY_AIRING, FINISHED_AIRING }

final statusValues = EnumValues({
  "Currently Airing": Status.CURRENTLY_AIRING,
  "Finished Airing": Status.FINISHED_AIRING,
});

class Title {
  final TitleType type;
  final String title;

  Title({required this.type, required this.title});

  factory Title.fromJson(Map<String, dynamic> json) =>
      Title(type: titleTypeValues.map[json["type"]]!, title: json["title"]);

  Map<String, dynamic> toJson() => {
    "type": titleTypeValues.reverse[type],
    "title": title,
  };
}

enum TitleType { DEFAULT, ENGLISH, FRENCH, GERMAN, JAPANESE, SPANISH, SYNONYM }

final titleTypeValues = EnumValues({
  "Default": TitleType.DEFAULT,
  "English": TitleType.ENGLISH,
  "French": TitleType.FRENCH,
  "German": TitleType.GERMAN,
  "Japanese": TitleType.JAPANESE,
  "Spanish": TitleType.SPANISH,
  "Synonym": TitleType.SYNONYM,
});

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
    embedUrl: json["embed_url"] ?? '',
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

enum AnimeResponseType { MOVIE, TV }

final AnimeResponseTypeValues = EnumValues({
  "Movie": AnimeResponseType.MOVIE,
  "TV": AnimeResponseType.TV,
});

class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final Items items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    lastVisiblePage: json["last_visible_page"],
    hasNextPage: json["has_next_page"],
    currentPage: json["current_page"],
    items: Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "last_visible_page": lastVisiblePage,
    "has_next_page": hasNextPage,
    "current_page": currentPage,
    "items": items.toJson(),
  };
}

class Items {
  final int count;
  final int total;
  final int perPage;

  Items({required this.count, required this.total, required this.perPage});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    count: json["count"],
    total: json["total"],
    perPage: json["per_page"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "total": total,
    "per_page": perPage,
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
