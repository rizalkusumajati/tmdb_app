
import 'package:dio/dio.dart';
import 'package:tmdb_app/data/api/api_services.dart';
import 'package:tmdb_app/data/api/response/genre_response.dart';
import 'package:tmdb_app/logic/cubit/api_state.dart';
import 'package:tmdb_app/logic/models/genre.dart';
import 'package:logger/logger.dart';

class GenreRepository{
  final ApiServices apiServices ;

  GenreRepository(this.apiServices);

 Future<ApiState> getGenre() async{
    ApiState initState = ApiStateLoading();
     await apiServices.getMovieGenre().then((value) => {
       initState = ApiStateSuccess(value.genres.map((e) => e.toDomain()).toList())
    }).catchError((Object obj){
      Logger().i("Error: " + obj.toString());
      switch(obj.runtimeType){
        case DioError:
          final res = (obj as DioError).response;
          Logger().e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          initState = ApiStateError(res?.statusMessage);
          break;
        default:
          break;
      }
    });
    Logger().i("Error: " + initState.toString());
    return initState;
  }
}
