import 'dart:ui';

import 'package:custom_appbar/core/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  Offset of = Offset(0.0, 0.0);
  double _reSize = 0;
  double _opacity = 1.0;
  double _nameSize = 20.0;
  double _emailSize = 16.0;
  bool _handleScrollNotification(ScrollNotification snt) {
    double pixels = snt.metrics.pixels;

    setState(() {
      of = Offset(0.0, -pixels);
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        _opacity = pixels >= 8.0 ? 0.0 : 1.0;
        if (pixels <= 40.0) {
          _nameSize = 20 - (pixels * 0.1);
          _emailSize = 16 - (pixels * 0.1);
        }
      } else if (controller.position.userScrollDirection ==
          ScrollDirection.forward) {
        _opacity = pixels <= 20.0 ? 1.0 : 0.0;
        if (pixels <= 40.0) {
          if (_nameSize <= 20.0) {
            _nameSize += .1;
          }
          if (_emailSize <= 16.0) {
            _emailSize += .1;
          }
        }
      }
    });
    if (snt.metrics.pixels <= snt.metrics.minScrollExtent + 75) {
      setState(() {
        _reSize = pixels;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (scroll) {
            return _handleScrollNotification(scroll);
          },
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: _size.height * .24,
              bottom: _size.height * .1,
            ),
            controller: controller,
            itemBuilder: (context, item) => ListTile(
              title: Text(
                "Flutter / $item",
              ),
            ),
          ),
        ),
        Container(
          height: kToolbarHeight + 18,
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
        ),
        Transform.translate(
          offset: of,
          child: Container(
            width: _size.width,
            child: SvgPicture.asset(
              'assets/images/RedOne.svg',
              height: _size.height * .24,
              width: _size.width,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: kToolbarHeight + 10,
          decoration: BoxDecoration(
            color: appColor,
          ),
        ),
        Container(
          height: _size.height * .20 - _reSize - 8,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(150)),
                    child: Image(
                      height: 120 - _reSize, //50
                      width: 120 - _reSize,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://d500.epimg.net/cincodias/imagenes/2015/05/12/lifestyle/1431450742_990504_1431450837_noticia_normal.jpg',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: _size.width * .02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedOpacity(
                      opacity: _opacity,
                      duration: Duration(milliseconds: 500),
                      child: Transform.translate(
                        offset: Offset(0.0, _reSize <= 14 ? -_reSize : -14),
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            'Bienvenido(a):',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _nameSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, _reSize <= 14 ? -_reSize : -14),
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          'Manuel Goncalves',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _nameSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Transform.translate(
                      offset: Offset(0.0, _reSize <= 14 ? -_reSize : -14),
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          'mgoncalves@acl.cl',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _emailSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
