// ignore: non_constant_identifier_names

// På rejser med Metroen er der et tillæg på 1,50 kr.
//(halv pris for børn). (Pris gældende fra 16. januar 2022)

// Der gives 20% rabat med rejsekort på hverdage mellem kl. 11-13 og kl.
// 18-07 samt på lørdage, søndage og helligdage – også på tillæg til metro.

// Børn og pensionister får rabat ved at rejse med rejsekort.
// Børn i alderen 0-15 år får en besparelse på 50 pct.,
// mens pensionister får en besparelse på 25 pct.

final ZONE_PRICE = {
  1: 12.00,
  2: 16.50,
  3: 21.50,
  4: 27.50,
  5: 34.00,
  6: 40.00,
  7: 45.50,
  8: 50.50,
  9: 57.00,
  10: 63.00,
  11: 69.00,
  12: 78.00,
  13: 87.00,
  14: 94.00,
  15: 100.00,
  16: 107.00,
  17: 112.00,
  18: 117.00,
  19: 122.00,
  20: 125.00,
  21: 128.00,
  22: 131.00,
  23: 134.00,
  24: 137.00,
  25: 140.00,
  26: 143.00,
  27: 146.00,
  28: 149.00,
  29: 153.00,
  30: 156.00,
};

final ZONE_NAMES_KEYS = [
  1,
  2,
  3,
  4,
  8,
  30,
  31,
  32,
  33,
  40,
  41,
  42,
  43,
  44,
  50,
  51,
  52,
  53,
  54,
  55,
  60,
  61,
  62,
  63,
  64,
  65,
  66,
  67,
  70,
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  80,
  81,
  82,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  95,
  96,
  97
];

final ZONE_NAMES = {
  1: 'København', // København, Frederiksberg, City
  2: 'Valby', //  Valby, Vanløse, Nørrebro, Rypark
  3: 'Ørestaden', // Ørestaden og Sundbyerne
  4: 'Dragør', //  Lufthavnen, Tårnby og Dragør
  8: 'Roskilde',
  30: 'Hellerup', //  Hellerup og Gentofte
  31: 'Herlev', //  Buddinge, Gladsaxe og Herlev
  32: 'Brøndbyøster', // Brøndbyøster og Rødovre
  33: 'Avedøre', // Avedøre og Friheden
  40: 'Klampenborg',
  41: 'Lyngby', // Lyngby, Bagsværd og Hareskov
  42: 'Ballerup', // Ballerup og Skovlunde
  43: 'Glostrup',
  44: 'Vallensbæk', // Brøndby Strand og Vallensbæk
  50: 'Nærum', // Nærum og Skodsborg
  51: 'Lyngby', // Lyngby, Virum og Holte
  52: 'Værløse', // Værløse
  53: 'Ballerup', // Ballerup, Måløv og Kildedal
  54: 'Albertslund', // Albertslund og Taastrup
  55: 'Hundige', // Hundige og Ishøj
  60: 'Skadsborg', //  Skodsborg og Vedbæk
  61: 'Bistrup',
  62: 'Farum',
  63: 'Kildedal',
  64: 'Smørum',
  65: 'Sengeløse',
  66: 'Høje Taastrup',
  67: 'Greve',
  70: 'Kokkedal', // Rungsted
  71: 'Birkerød', // Blovstrød
  72: 'Nymølle',
  73: 'Ganløse',
  74: 'Stenløse', // Veksø
  75: 'Gundsølille',
  76: 'Hedehusene', // Trekroner
  77: 'Karlslunde',

  80: 'Nivå',
  81: 'Karlebo',
  82: 'Allerød',
  83: 'Lynge',
  84: 'Buresø',
  85: 'Ølstykke',
  86: 'Risø',
  87: 'Tjæreby',
  88: 'Gadstrup', // Gadstrup og Snoldelev
  89: 'Solrød Strand',

  95: 'Gevninge',
  96: 'Lejre',
  97: 'Viby Sjælland',
};

// ignore: non_constant_identifier_names
Map graph = {
  // Storkøbenhavn
  1: {3: 1, 2: 1},
  2: {3: 1, 1: 1, 30: 1, 31: 1, 32: 1, 33: 1},
  3: {4: 1, 1: 1, 2: 1},
  4: {3: 1},
  8: {95: 1, 86: 1, 75: 1, 96: 1, 76: 1, 97: 1, 87: 1},

  30: {2: 1, 31: 1, 41: 1, 40: 1},
  31: {2: 1, 32: 1, 43: 1, 42: 1, 41: 1, 30: 1},
  32: {33: 1, 44: 1, 43: 1, 42: 1, 31: 1, 2: 1},
  33: {2: 1, 44: 1, 43: 1, 32: 1},

  40: {30: 1, 41: 1, 51: 1, 50: 1},
  41: {31: 1, 42: 1, 53: 1, 52: 1, 51: 1, 50: 1, 40: 1, 30: 1},
  42: {32: 1, 31: 1, 41: 1, 52: 1, 53: 1, 54: 1, 43: 1},
  43: {31: 1, 32: 1, 33: 1, 42: 1, 44: 1, 55: 1, 54: 1, 53: 1},
  44: {32: 1, 33: 1, 43: 1, 54: 1, 55: 1},

  50: {40: 1, 41: 1, 51: 1, 60: 1},
  51: {50: 1, 40: 1, 60: 1, 61: 1, 62: 1, 52: 1, 41: 1},
  52: {61: 1, 51: 1, 41: 1, 42: 1, 53: 1, 63: 1, 62: 1},
  53: {62: 1, 52: 1, 41: 1, 63: 1, 42: 1, 65: 1, 54: 1, 43: 1},
  54: {64: 1, 53: 1, 42: 1, 65: 1, 43: 1, 66: 1, 55: 1, 44: 1},
  55: {66: 1, 54: 1, 43: 1, 67: 1, 44: 1},

  60: {70: 1, 71: 1, 61: 1, 61: 1, 51: 1, 50: 1},
  61: {70: 1, 60: 1, 51: 1, 71: 1, 51: 1, 72: 1, 62: 1, 52: 1},
  62: {71: 1, 61: 1, 51: 1, 72: 1, 52: 1, 73: 1, 63: 1, 53: 1},
  63: {72: 1, 62: 1, 52: 1, 73: 1, 53: 1, 74: 1, 64: 1},
  64: {74: 1, 63: 1, 53: 1, 75: 1, 65: 1, 54: 1},
  65: {74: 1, 64: 1, 53: 1, 75: 1, 54: 1, 76: 1, 66: 1},
  66: {75: 1, 65: 1, 54: 1, 76: 1, 77: 1, 67: 1, 55: 1},
  67: {76: 1, 66: 1, 77: 1, 55: 1},

  70: {80: 1, 60: 1, 81: 1, 71: 1, 61: 1},
  71: {80: 1, 70: 1, 60: 1, 81: 1, 61: 1, 82: 1, 83: 1, 72: 1, 62: 1},
  72: {82: 1, 71: 1, 61: 1, 83: 1, 62: 1, 84: 1, 73: 1, 63: 1},
  73: {83: 1, 72: 1, 62: 1, 84: 1, 63: 1, 85: 1, 74: 1},
  74: {84: 1, 73: 1, 63: 1, 85: 1, 64: 1, 86: 1, 75: 1, 65: 1},
  75: {85: 1, 74: 1, 64: 1, 86: 1, 65: 1, 8: 1, 76: 1, 66: 1},
  76: {86: 1, 75: 1, 65: 1, 8: 1, 66: 1, 87: 1, 88: 1, 77: 1, 67: 1},
  77: {76: 1, 66: 1, 87: 1, 88: 1, 89: 1, 67: 1},
};
