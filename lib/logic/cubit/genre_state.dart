part of 'genre_cubit.dart';

@immutable
abstract class GenreState {}

class GenreInitial extends GenreState {}
class GenreSuccess extends GenreState {
  final List<Genre> data;

  GenreSuccess({
    @required this.data = const[],
  });
}
class GenreError extends GenreState{

}
