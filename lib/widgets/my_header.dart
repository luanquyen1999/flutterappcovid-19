import 'package:flutter/material.dart';
import 'package:flutter_app_ui_covid19/info_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
import 'counter.dart';
class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const MyHeader({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 20, top: 50),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:[
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InfoScreen();
                        },
                      ),
                    );
                  },
                  child: SvgPicture.asset("assets/icons/menu.svg")),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[SvgPicture.asset(image,
                  width: 230,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
                  Positioned(
                    top: 20,
                    left:150,
                    child: Text(
                      "$textTop \n$textBottom.",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(),//i dont konw it not work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}