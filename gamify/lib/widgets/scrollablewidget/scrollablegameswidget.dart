import 'package:flutter/material.dart';
import 'package:gamify/data.dart';

class Scrollablegameswidget extends StatelessWidget {
  final double height;
  final double width;
  final bool _showTitle;
  final List<Game> _gamesData;

  Scrollablegameswidget(
      this.height, this.width, this._showTitle, this._gamesData);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: _gamesData.map((_games) {
            return Container(
              height: height,
              width: width * 0.3,
              padding: EdgeInsets.only(right: width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: height * 0.8,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(_games.coverImage.url))),
                  ),
                  _showTitle
                      ? Text(
                          _games.title,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white, fontSize: height * 0.063),
                        )
                      : Container()
                ],
              ),
            );
          }).toList()),
    );
  }
}
