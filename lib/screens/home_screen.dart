import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rejsekort/models/cards.dart';

import '../models/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final List<Rejsekort> _travelCards = [
    Rejsekort(
      id: "AW35SJSAW23SHJ6",
      type: 'Pendlerkort',
    ),
    Rejsekort(
      id: "HJS213SHSAW9S2H",
      type: 'Skolekort',
    ),
    // Rejsekort(
    //   id: "HJS213SHSAW9S2H",
    //   type: 'Rejsekort',
    // )
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          height: (mediaQuery.size.height) * 0.2,
          // margin: EdgeInsets.all(25),
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            radius: 40,
            child: CircleAvatar(
              radius: 37,
              backgroundColor: Colors.white,
              child: FaIcon(
                FontAwesomeIcons.nfcSymbol,
                size: 40,
                color: Colors.blue.shade300,
              ),
            ),
          ),
        ),
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 170.0,
              enlargeCenterPage: true,
              autoPlay: false,
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
              disableCenter: true,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  // Fortæller flutter at nyt data er passeret og skal rebuild hele programmet.
                  _currentIndex = index;
                });
              },
            ),
            items: _travelCards.map(
              (data) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/rejsekort.png',
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            data.id,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 110,
                      //   right: 20,
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //       vertical: 5,
                      //       horizontal: 20,
                      //     ),
                      //     child: Text(
                      //       data.type.toUpperCase(),
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         color: Colors.blue.shade600,
                      //         fontWeight: FontWeight.w700,
                      //         letterSpacing: 1,
                      //       ),
                      //       softWrap: true,
                      //       overflow: TextOverflow.fade,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DotsIndicator(
          decorator: const DotsDecorator(
            size: Size.square(5),
          ),
          dotsCount: _travelCards.length,
          position: _currentIndex.toDouble(),
        ),
      ],
    );
  }
}
