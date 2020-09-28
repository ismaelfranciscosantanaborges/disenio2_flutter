import 'package:flutter/material.dart';
import 'package:planet/data/data.dart';

import '../constants.dart' as mc;

class Details extends StatelessWidget {
  static final String routerName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    PlanetInfo planet = ModalRoute.of(context).settings.arguments;
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 20,
                child: Text(
                  planet.position.toString(),
                  style: TextStyle(
                      fontSize: 250,
                      fontFamily: 'Avenir',
                      color: Colors.grey.withOpacity(0.3),
                      fontWeight: FontWeight.w700),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(),
                      SizedBox(
                        height: _size.height * 0.3,
                      ),
                      Text(
                        planet.name,
                        style: TextStyle(
                          color: mc.primaryTextColor,
                          fontSize: 42,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Solar System',
                        style: TextStyle(
                          color: mc.primaryTextColor,
                          fontSize: 32,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        endIndent: 25,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 25, bottom: 25, right: 25),
                        child: Text(
                          planet.description,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 18,
                            color: mc.contentTextColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        endIndent: 25,
                      ),
                      Column(
                        //////////
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              color: mc.primaryTextColor,
                              fontSize: 22,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: planet.images.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, bottom: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: _size.width * 0.5,
                                      child: Image.network(
                                        planet.images[index],
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loading) {
                                          if (loading == null) return child;

                                          return Center(
                                            child: CircularProgressIndicator(
                                                value: loading
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loading
                                                            .cumulativeBytesLoaded /
                                                        loading
                                                            .expectedTotalBytes
                                                    : null),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () => Navigator.pop(context),
                  iconSize: 40,
                ),
              ),
              Positioned(
                top: 10,
                right: MediaQuery.of(context).size.width * (-0.12),
                child: Hero(
                  tag: planet.position,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      planet.iconImage,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
