import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb_app/logic/models/genre.dart';
part 'genre_response.g.dart';
/// genres : [{"id":10759,"name":"Action & Adventure"},{"id":16,"name":"Animation"},{"id":35,"name":"Comedy"},{"id":80,"name":"Crime"},{"id":99,"name":"Documentary"},{"id":18,"name":"Drama"},{"id":10751,"name":"Family"},{"id":10762,"name":"Kids"},{"id":9648,"name":"Mystery"},{"id":10763,"name":"News"},{"id":10764,"name":"Reality"},{"id":10765,"name":"Sci-Fi & Fantasy"},{"id":10766,"name":"Soap"},{"id":10767,"name":"Talk"},{"id":10768,"name":"War & Politics"},{"id":37,"name":"Western"}]
@JsonSerializable()
class GenreResponse {
  List<Genres> _genres = [];

  List<Genres> get genres => _genres;

  GenreResponse({
      List<Genres> genres = const []}){
    _genres = genres;
}

  GenreResponse.fromJson(dynamic json) {
    if (json["genres"] != null) {
      _genres = [];
      json["genres"].forEach((v) {
        _genres.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_genres != null) {
      map["genres"] = _genres.map((v) => v.toJson()).toList();
    }
    return map;
  }

  List<Genre> toDomain(){
    return genres.map((item) => item.toDomain()).toList();
  }

}

/// id : 10759
/// name : "Action & Adventure"
@JsonSerializable()
class Genres {
  int _id = 0;
  String _name = "";

  int get id => _id;
  String get name => _name;

  Genres({
      int id = 0,
      String name = ""}){
    _id = id;
    _name = name;
}

  Genres.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

  Genre toDomain(){
    Genre genre = Genre(
      id,
      name
    );

    return genre;
  }

}

