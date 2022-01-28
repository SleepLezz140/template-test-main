import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MoviesTop250RequestResponse {
  MoviesTop250RequestResponse(
      {required this.items, required this.errorMessage});

  factory MoviesTop250RequestResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesTop250RequestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesTop250RequestResponseToJson(this);

  final List<MovieObject> items;
  final String errorMessage;
}

@JsonSerializable()
class MovieObject {
  MovieObject({
    required this.id,
    required this.rank,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.crew,
    required this.imDbRating,
    required this.imDbRatingCount,
  });

  factory MovieObject.fromJson(Map<String, dynamic> json) =>
      _$MovieObjectFromJson(json);
  Map<String, dynamic> toJson() => _$MovieObjectToJson(this);

  final String id;
  final String rank;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String crew;
  final String imDbRating;
  final String imDbRatingCount;
}
