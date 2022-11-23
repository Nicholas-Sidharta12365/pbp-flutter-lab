// To parse this JSON data, do
//
//     final watchlist = watchlistFromJson(jsonString);

import 'dart:convert';

List<Watchlist> watchlistFromJson(String str) => List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String watchlistToJson(List<Watchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Watchlist {
    Watchlist({
        required this.watched,
        required this.title,
        required this.movieRating,
        required this.releaseDate,
        required this.review,
    });

    bool watched;
    String title;
    double movieRating;
    String releaseDate;
    String review;

    factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        watched: json["watched"],
        title: json["title"],
        movieRating: json["movie_rating"].toDouble(),
        releaseDate: json["release_date"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "movie_rating": movieRating,
        "release_date": releaseDate,
        "review": review,
    };
}
