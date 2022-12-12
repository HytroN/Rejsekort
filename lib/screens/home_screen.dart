import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:rejsekort/widgets/transition/transactions_list.dart';

import '../models/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _travelCards = [
    {'text': 'text1'},
    {'text': 'text2'},
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height) * 0.2,
          // margin: EdgeInsets.all(25),
          child: CircleAvatar(
            radius: 40,
            child: CircleAvatar(
              radius: 37,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.wifi,
                size: 40,
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
              (i) {
                return Container(
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      '${i['text']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: _travelCards.length,
          position: _currentIndex.toDouble(),
        )
      ],
    );
  }
}
