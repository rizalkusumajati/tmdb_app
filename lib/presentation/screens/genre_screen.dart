import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/logic/cubit/api_state.dart';
import 'package:tmdb_app/logic/cubit/genre_cubit.dart';
import 'package:tmdb_app/logic/models/genre.dart';
import 'package:tmdb_app/presentation/screens/widgets/default_app_bar.dart';
import 'package:tmdb_app/presentation/screens/widgets/default_drawer.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GenreCubit>(context).getGenre();
    return Scaffold(
      appBar: SimpleAppBarTitle.simpleAppBar(),
      drawer: SimpleDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: BlocBuilder<GenreCubit, ApiState>(builder: (context, state) {
          if (state is ApiStateSuccess<List<Genre>>) {
            final genreItems = state.response;
            return ListView.separated(
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) => Divider(
                color: Colors.greenAccent,
              ),
                itemCount: genreItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    genreItems[index].name,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                );
          } else if (state is ApiStateLoading) {
            return CircularProgressIndicator();
          } else {
            return const Text(
              'Error',
            );
          }
        }),
      ),
    );
  }

  Widget _genre(Genre genre) {
    return Text(
      genre.name,
      style: TextStyle(fontSize: 18),
    );
  }
}
