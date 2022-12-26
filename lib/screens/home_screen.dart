import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rejsekort/widgets/home/card_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: FaIcon(
                FontAwesomeIcons.nfcSymbol,
                size: 40,
                color: Colors.blue.shade300,
              ),
            ),
          ),
        ),
        Container(
          child: CardCarousel(),
        ),
      ],
    );
  }
}
