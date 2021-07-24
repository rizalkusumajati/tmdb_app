import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_app/data/api/api_services.dart';
import 'package:tmdb_app/data/api/response/genre_response.dart';
import 'package:tmdb_app/data/repositories/GenreRepository.dart';
import 'package:tmdb_app/logic/cubit/api_state.dart';
import 'package:tmdb_app/logic/models/genre.dart';
import 'package:logger/logger.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<ApiState> {
  GenreRepository genreRepository;
  GenreCubit(this.genreRepository): super(ApiStateLoading());

  void getGenre(){
    genreRepository.getGenre().then((apiEvent) => {
      if(apiEvent is ApiStateSuccess<List<Genre>>){
        apiEvent.response.forEach((element) {
          Logger().i("Cubit: " + element.toString());
        }),
      },
      emit(apiEvent)
    });
  }
}
