
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/app_router.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          _createHeader(context),
          _createItem(context, "Genre", () {
            Navigator.of(context).pushReplacementNamed(RouteName.GENRE_PAGE);
          }),
          _createItem(context, "Popular", () {
            Navigator.of(context).pushReplacementNamed(RouteName.POPULAR_PAGE);
          })
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context){
    return DrawerHeader(
      child: Container(
        height: 142,
        width: MediaQuery.of(context).size.width,
        child: Icon(Icons.ten_k),
        margin: EdgeInsets.all(10),
        color: Colors.redAccent,
      ),
      decoration: BoxDecoration(color: Colors.greenAccent),
    );
  }

  Widget _createItem(BuildContext context, String title, GestureTapCallback onTap){
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: TextStyle(fontSize: 26),
        ),
      ),
      onTap: onTap,
    );
  }
}


