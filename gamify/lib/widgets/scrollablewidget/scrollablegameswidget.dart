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
          scrollDirection: Axis.horizontal,
          children: _gamesData.map((_games) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: height * 0.8,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(_games.coverImage.url))),
                  ),
                  Text("")
                ],
              ),
            );
          }).toList()),
    );
  }
}
