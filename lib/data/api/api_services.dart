import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tmdb_app/data/api/response/genre_response.dart';

part 'api_services.g.dart';

class Apis{
  static const BASE_URL = "https://api.themoviedb.org/3";
  static const GENRE_MOVIE = "/genre/movie/list";
  static const API_KEY = "1557853c72890ec559e5ce537b9adb24";
}

@RestApi(baseUrl: Apis.BASE_URL)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;


  @GET(Apis.GENRE_MOVIE)
  Future<GenreResponse> getMovieGenre({@Query("api_key") String apiKey = Apis.API_KEY});
}

