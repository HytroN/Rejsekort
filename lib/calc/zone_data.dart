// ignore: non_constant_identifier_names

// På rejser med Metroen er der et tillæg på 1,50 kr.
//(halv pris for børn). (Pris gældende fra 16. januar 2022)

// Der gives 20% rabat med rejsekort på hverdage mellem kl. 11-13 og kl.
// 18-07 samt på lørdage, søndage og helligdage – også på tillæg til metro.

// Børn og pensionister får rabat ved at rejse med rejsekort.
// Børn i alderen 0-15 år får en besparelse på 50 pct.,
// mens pensionister får en besparelse på 25 pct.

final ZONE_PRICE = [
  {
    'zone_2': 16.50,
  },
  {
    'zone_3': 21.50,
  },
  {
    'zone_4': 27.50,
  },
  {
    'zone_5': 34.00,
  },
  {
    'zone_6': 40.00,
  },
  {
    'zone_7': 45.50,
  },
  {
    'zone_8': 50.50,
  },
  {
    'zone_9': 57.00,
  },
  {
    'zone_10': 63.00,
  },
  {
    'zone_11': 69.00,
  },
  {
    'zone_12': 78.00,
  },
  {
    'zone_13': 87.00,
  },
  {
    'zone_14': 94.00,
  },
  {
    'zone_15': 100.00,
  },
  {
    'zone_16': 107.00,
  },
  {
    'zone_17': 112.00,
  },
  {
    'zone_18': 117.00,
  },
  {
    'zone_19': 122.00,
  },
  {
    'zone_20': 125.00,
  },
  {
    'zone_21': 128.00,
  },
  {
    'zone_22': 131.00,
  },
  {
    'zone_23': 134.00,
  },
  {
    'zone_24': 137.00,
  },
  {
    'zone_25': 140.00,
  },
  {
    'zone_26': 143.00,
  },
  {
    'zone_27': 146.00,
  },
  {
    'zone_28': 149.00,
  },
  {
    'zone_29': 153.00,
  },
  {
    'zone_30': 156.00,
  },
];

// ignore: non_constant_identifier_names
final ZONES_DATA = [
  {
    'city': 'Høje Taastrup',
    'zone_number': 66,
    'zipecode': 2630,
    'zone_distance': 1,
    'city_nearby': {
      'Sengeløse': {
        'zone_distance': 2,
        'zone_number': 65,
        'zipecode': 2630,
      },
      'Grundsølille': {
        'zone_distance': 2,
        'zone_number': 75,
        'zipcode': 4000,
      },
      'Hedehusene': {
        'zone_distance': 2,
        'zone_number': 76,
        'zipcode': 2640,
      },
      'Trekroner': {
        'zone_distance': 2,
        'zone_number': 76,
        'zipcode': 4000,
      },
      'Karlslunde': {
        'zone_distance': 2,
        'zone_number': 77,
        'zipcode': 2690,
      },
      'Greve': {
        'zone_distance': 2,
        'zone_number': 67,
        'zipcode': 2670,
      },
      'Ishøj': {
        'zone_distance': 2,
        'zone_number': 55,
        'zipcode': 2635,
      },
      'Hundige': {
        'zone_distance': 2,
        'zone_number': 55,
        'zipcode': 2670,
      },
      'Taastrup': {
        'zone_distance': 2,
        'zone_number': 54,
        'zipcode': 2630,
      },
      'Albertslund': {
        'zone_distance': 2,
        'zone_number': 54,
        'zipcode': 2620,
      },
      'Smørum': {
        'zone_distance': 3,
        'zone_number': 64,
        'zipcode': 2765,
      },
      'Ballerup': {
        'zone_distance': 3,
        'zone_number': 53,
        'zipcode': 2750,
      },
      'Måløv': {
        'zone_distance': 3,
        'zone_number': 53,
        'zipcode': 2760,
      },
      'Kildedal': {
        'zone_distance': 3,
        'zone_number': 53,
        'zipcode': 'Unknown',
      },
      'Brøndby Strand': {
        'zone_distance': 3,
        'zone_number': 44,
        'zipcode': 2660,
      },
      'Vallensbæk': {
        'zone_distance': 3,
        'zone_number': 44,
        'zipcode': 2625,
      },
    }
  },
  // {
  //   'city': 'Your_City',
  //   'zone_number': 999, // The zone number of the city
  //   'zipecode': 0000, // The zipcode of the main city
  //   'zone_distance': 1, // Don't touch this. This will always be zone_distance 1,
  // 'city_nearby': { // All zones around the main city
  //   'YOUR_NEARBY_CITY': {
  //     'zone_distance': 3, // Zone distance from the main city
  //     'zone_number': 44, // Zone number from map
  //     'zipcode': 2625,  // Zip code from map
  //   },
  //   'YOUR_NEARBY_CITY': {
  //     'zone_distance': 3, // Zone distance from the main city
  //     'zone_number': 66, // Zone number from map
  //     'zipcode': 2630, // Zip code from map
  //   },
  // }
  // },
];
