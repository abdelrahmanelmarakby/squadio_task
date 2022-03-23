class PopularPersonModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularPersonModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularPersonModel.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
    if (json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
    if (json["total_results"] is int) {
      totalResults = json["total_results"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    if (results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  int? gender;
  int? id;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  Results(
      {this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["adult"] is bool) {
      adult = json["adult"];
    }
    if (json["gender"] is int) {
      gender = json["gender"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["known_for"] is List) {
      knownFor = json["known_for"] == null
          ? null
          : (json["known_for"] as List)
              .map((e) => KnownFor.fromJson(e))
              .toList();
    }
    if (json["known_for_department"] is String) {
      knownForDepartment = json["known_for_department"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if (json["profile_path"] is String) {
      profilePath = json["profile_path"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["gender"] = gender;
    data["id"] = id;
    if (knownFor != null) {
      data["known_for"] = knownFor?.map((e) => e.toJson()).toList();
    }
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  KnownFor(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  KnownFor.fromJson(Map<String, dynamic> json) {
    if (json["adult"] is bool) {
      adult = json["adult"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if (json["genre_ids"] is List) {
      genreIds =
          json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["media_type"] is String) {
      mediaType = json["media_type"];
    }
    if (json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if (json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if (json["overview"] is String) {
      overview = json["overview"];
    }
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["video"] is bool) {
      video = json["video"];
    }
    if (json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if (json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) {
      data["genre_ids"] = genreIds;
    }
    data["id"] = id;
    data["media_type"] = mediaType;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
