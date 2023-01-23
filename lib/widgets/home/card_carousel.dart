import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardCarousel extends StatefulWidget {
  const CardCarousel({super.key});

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int current = 0;
  int cardLength = 0;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('cards')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final userDocs = snapshot.data!.docs;
        return Column(
          children: [
            CarouselSlider(
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
                    current = index;
                    print(current);
                  });
                },
              ),
              items: userDocs.map(
                (data) {
                  cardLength = userDocs.length;
                  return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/${data['type']}.png',
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (data['money'] != null)
                            Positioned(
                              bottom: 65,
                              right: 65,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 20,
                                ),
                                child: FittedBox(
                                  child: Text(
                                    '${data['money']?.toStringAsFixed(2)} kr.',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Text(
                                data.id.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            if (cardLength > 0)
              DotsIndicator(
                decorator: const DotsDecorator(
                  size: Size.square(5),
                ),
                dotsCount: cardLength,
                position: current.toDouble(),
              ),
          ],
        );
      },
    );
  }
}
