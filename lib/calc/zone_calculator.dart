import '../calc/zone_data.dart';

// Børn i alderen 0-15 år får en besparelse på 50 pct,
// mens pensionister får en besparelse på 25 pct.
// For pensionister gælder dog, at billetten skal have en
// rejselængde på mindst 4 zoner.

int zoneData(String fromStation, String toStation) {
  var zoneDistance;

  for (Map<String, dynamic> cityData in ZONES_DATA) {
    if (cityData['city'] == fromStation) {
      Map<String, dynamic> cityNearby = cityData['city_nearby'];
      if (cityNearby.containsKey(toStation)) {
        Map<String, dynamic> nearbyCityDetails = cityNearby[toStation];
        int zoneNumber = nearbyCityDetails['zone_number'];
        zoneDistance = nearbyCityDetails['zone_distance'];
        int zoneZipcode = nearbyCityDetails['zipcode'];
        print('Zone number for $toStation: $zoneNumber');
        print('Zone distance from $toStation: $zoneDistance');
        print('Zone zipcode from $toStation: $zoneZipcode');
      } else {
        print('This ZONE_DATA does not contain any zones with name $toStation');
      }
    }
  }
  return zoneDistance;
}

double calculatePrice(int zone) {
  var totalPrice;
  for (var element in ZONE_PRICE) {
    if (element.containsKey('zone_$zone')) {
      totalPrice = element['zone_$zone'];
      break;
    }
  }
  return totalPrice;
}

double discountPrice(int age, double originalPrice) {
  // Calculate the discount
  var now = DateTime.utc(1969, 7, 20, 07, 18, 04);
  var time =
      now.hour >= 11 && now.hour <= 13 || now.hour >= 18 && now.hour <= 20;
  var discount = 0.0;
  if (age >= 60) {
    discount = 25;
  } else if (age >= 0 && age <= 15) {
    discount = 50;
  } else if (time) {
    discount = 20;
  } else if (time && age >= 60) {
    discount = 45;
  } else if (time && (age >= 0 && age <= 15)) {
    discount = 70;
  } else {
    discount = 0;
  }

  // Subtract the discount from the original price
  double discountedPrice = originalPrice - (discount * originalPrice / 100);

  return discountedPrice;
}
