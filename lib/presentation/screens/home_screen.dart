
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_app/presentation/screens/widgets/default_app_bar.dart';
import 'package:tmdb_app/presentation/screens/widgets/default_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarTitle.simpleAppBar(),
      drawer: SimpleDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This Is Home Screen',
            ),
          ],
        ),
      ),
    );
  }
}
