import '../calc/zone_data.dart';

void zoneData(String fromStation, String toStation) {
  for (Map<String, dynamic> cityData in ZONES_DATA) {
    if (cityData['city'] == fromStation) {
      Map<String, dynamic> cityNearby = cityData['city_nearby'];
      if (cityNearby.containsKey(toStation)) {
        Map<String, dynamic> nearbyCityDetails = cityNearby[toStation];
        int zoneNumber = nearbyCityDetails['zone_number'];
        int zoneDistance = nearbyCityDetails['zone_distance'];
        print('Zone number for $toStation: $zoneNumber');
        print('Zone distance from $toStation: $zoneDistance');
      } else {
        print('This ZONE_DATA does not contain any zones with name $toStation');
      }
    }
  }
}
