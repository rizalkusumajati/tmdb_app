import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/data/api/api_services.dart';
import 'package:tmdb_app/data/repositories/GenreRepository.dart';
import 'package:tmdb_app/logic/cubit/genre_cubit.dart';
import 'package:tmdb_app/presentation/screens/genre_screen.dart';
import 'package:tmdb_app/presentation/screens/home_screen.dart';
import 'package:tmdb_app/util/util.dart';

class AppRouter {
  Route onGetRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.GENRE_PAGE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GenreCubit(GenreRepository(ApiServices(setupDio()))),
                  child: GenreScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

class RouteName {
  static const String HOME_PAGE = "/";
  static const String GENRE_PAGE = "/genre";
  static const String POPULAR_PAGE = "/popular";
}
