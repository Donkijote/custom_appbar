import 'package:custom_appbar/core/bottom_clipper.dart';
import 'package:custom_appbar/core/values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: CurvedBottomClipper(),
          child: Container(
            height: _size.height * .30,
            decoration: BoxDecoration(
              color: appColor,
            ),
            child: Row(
              children: [
                SizedBox(width: _size.width * .04),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(160),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(160)),
                    child: Image(
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://d500.epimg.net/cincodias/imagenes/2015/05/12/lifestyle/1431450742_990504_1431450837_noticia_normal.jpg',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: _size.width * .04),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        'Bienvenido(a):',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        'Manuel Goncalves',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            'Home Page',
          ),
        ),
      ],
    );
  }
}
