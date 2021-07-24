// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) {
  return GenreResponse(
    genres: (json['genres'] as List<dynamic>)
        .map((e) => Genres.fromJson(e))
        .toList(),
  );
}

Map<String, dynamic> _$GenreResponseToJson(GenreResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
