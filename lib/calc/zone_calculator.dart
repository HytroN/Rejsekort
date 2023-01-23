import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dijkstra/dijkstra.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../calc/zone_data.dart';

// Børn i alderen 0-15 år får en besparelse på 50 pct,
// mens pensionister får en besparelse på 25 pct.
// For pensionister gælder dog, at billetten skal have en
// rejselængde på mindst 4 zoner.

User? currentUser = FirebaseAuth.instance.currentUser;

void createTravelTransaction(int fromStation, int toStation, int age) async {
  DocumentReference ref = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser?.uid)
      .collection('transactions')
      .add({
    'fromStation': fromStation,
    'toStation': toStation,
    'price': calculatePrice(zoneData(fromStation, toStation), age),
    'timestamp': Timestamp.now(),
    'isTransport': true,
  });

  String documentId = ref.id;

  await ref.set({
    'id': documentId,
    'fromStation': fromStation,
    'toStation': toStation,
    'price': calculatePrice(zoneData(fromStation, toStation), age),
    'timestamp': Timestamp.now(),
    'isTransport': true
  });
}

int zoneData(int fromStation, int toStation) {
  var distance = Dijkstra.findPathFromGraph(graph, fromStation, toStation);
  return distance.length;
}

double calculatePrice(int zone, int age) {
  var totalPrice = ZONE_PRICE[zone];
  var now = DateTime.utc(1969, 7, 20, 18, 18, 04);
  var time =
      now.hour >= 11 && now.hour <= 13 || now.hour >= 18 && now.hour <= 20;

  var discount = 0.0;
  if (age >= 60 && zone > 4) {
    discount = 25;
  } else if (age >= 0 && age <= 15) {
    discount = 50;
  } else if (time) {
    discount = 20;
  } else if (time && (age >= 60 && zone > 4)) {
    discount = 45;
  } else if (time && (age >= 0 && age <= 15)) {
    discount = 70;
  }
  double discountedPrice = totalPrice! - (discount * totalPrice / 100);

  return discountedPrice;
}
