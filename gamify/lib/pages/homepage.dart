import 'package:flutter/material.dart';
import 'package:gamify/data.dart';
import 'package:gamify/widgets/scrollablewidget/scrollablegameswidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var deviceHeight;
  var deviceWidth;
  var _selectedGame;
  @override
  void initState() {
    super.initState();
    _selectedGame = 0;
  }

  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredGamesWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: deviceHeight * 0.5,
        width: deviceWidth,
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedGame = index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((_game) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_game.coverImage.url))),
            );
          }).toList(),
        ));
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: deviceHeight * 0.75,
        width: deviceWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 158, 158, 158),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.65, 1.0])),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.005),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topAppBarWidget(),
          SizedBox(
            height: deviceHeight * 0.13,
          ),
          _featuredGameInfoWidget(),
          Scrollablegameswidget(deviceHeight, deviceWidth, true, games),
        ],
      ),
    );
  }

  Widget _topAppBarWidget() {
    return SizedBox(
      height: deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget _featuredGameInfoWidget() {
    return SizedBox(
      height: deviceHeight * 0.17,
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,
            style: TextStyle(
              fontSize: deviceHeight * 0.040,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((_games) {
              bool isActive =
                  _games.title == featuredGames[_selectedGame].title;
              double circleRadius = deviceHeight * 0.006;
              return Container(
                height: circleRadius * 2,
                width: circleRadius * 2,
                margin: EdgeInsets.only(right: deviceWidth * 0.01),
                decoration: BoxDecoration(
                    color: isActive ? Colors.amberAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(100)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
