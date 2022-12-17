import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:im_animations/im_animations.dart';
import 'package:rejsekort/models/cards/generate_CardID.dart';

import '../models/cards/cards.dart';
import '../models/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final hasTransportCard = false;
  final List<TravelCard> _travelCards = [
    Rejsekort(
      id: generateId(),
      money: 255.00,
    ),
    PendlerCard(
      id: generateId(),
    ),
    SchoolCard(
      id: generateId(),
    )
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
              backgroundColor: Colors.grey[50],
              child: HeartBeat(
                beatsPerMinute: 45,
                child: FaIcon(
                  FontAwesomeIcons.nfcSymbol,
                  size: 40,
                  color: Colors.blue.shade300,
                ),
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
                          data.image,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (data.money != null)
                        Positioned(
                          bottom: 65,
                          right: 25,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            child: Text(
                              '${data.money.toStringAsFixed(2)} kr.',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
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
