import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SimpleAppBarTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Builder(
        builder: (context) =>
            Row(
              children: [
                IconButton(onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                    icon: SvgPicture.asset(
                      "assets/icons/meat.svg",
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    )),
                Expanded(
                    child: Center(child: Text("TMDB",
                      style: TextStyle(color: Colors.black, fontSize: 18),))),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    "assets/icons/user_default.png",),
                )
              ],
            ),
      ),
    );
  }

  static AppBar simpleAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: SimpleAppBarTitle(),
      elevation: 0,
      centerTitle: false,
    );
  }
}
