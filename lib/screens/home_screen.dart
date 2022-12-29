import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rejsekort/calc/zone_calculator.dart';
import 'package:rejsekort/widgets/home/card_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var getZone = zoneData('Høje Taastrup', 'Greve');
    var calcPrice = calculatePrice(getZone, 14);
    print('$calcPrice kr.');
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      child: CardCarousel(),
    );
  }
}
