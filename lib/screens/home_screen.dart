import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:planet/data/data.dart';
import 'package:planet/screens/details_screen.dart';

import '../constants.dart' as mc; //myColors

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static final String routerName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mc.gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [mc.gradientStartColor, mc.gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _header(),
              _body(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: mc.navigationColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            Icons.home,
            color: Colors.white.withOpacity(0.4),
            size: 34,
          ),
          Icon(Icons.search, color: Colors.white.withOpacity(0.4), size: 34),
          Icon(Icons.supervised_user_circle,
              color: Colors.white.withOpacity(0.4), size: 34)
        ]),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Swiper(
          itemCount: planets.length,
          layout: SwiperLayout.STACK,
          itemWidth: MediaQuery.of(context).size.width - (2 * 74),
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(activeSize: 20, space: 5)),
          itemBuilder: (context, index) {
            final planet = planets[index];

            return CardPlanet(planet: planet);
          },
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Explore',
            style: TextStyle(
                color: mc.titleTextColor,
                fontSize: 42,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w800),
          ),
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text(
                  'Solar System',
                  style: TextStyle(
                    color: mc.contentTextColor,
                    fontSize: 18,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
            underline: SizedBox(),
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset('assets/drop_down_icon.png'),
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class CardPlanet extends StatelessWidget {
  const CardPlanet({
    Key key,
    @required this.planet,
  }) : super(key: key);

  final PlanetInfo planet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Expanded(
              child: _card(context),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1)
          ],
        ),
        _imgPlanet(context),
      ],
    );
  }

  Align _imgPlanet(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Hero(
        tag: planet.position,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Image.asset(
            planet.iconImage,
          ),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Stack(
      children: <Widget>[
        
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: mc.titleTextColor,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  planet.name,
                  style: TextStyle(
                    color: mc.primaryTextColor,
                    fontSize: 32,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Solar System',
                  style: TextStyle(
                      color: mc.contentTextColor,
                      fontSize: 22,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Text(
                        'Know more',
                        style: TextStyle(
                            color: mc.secondaryTextColor, fontSize: 18),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: mc.secondaryTextColor,
                      )
                    ],
                  ),
                  onTap: () => Navigator.pushNamed(context, Details.routerName,
                      arguments: planet),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
