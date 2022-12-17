abstract class TravelCard {
  final String id;
  final String type;
  final String image;

  TravelCard({
    required this.id,
    required this.type,
    required this.image,
  });

  get money => null;
}

class Rejsekort extends TravelCard {
  final double money;

  Rejsekort({
    required String id,
    required this.money,
  }) : super(id: id, image: 'assets/images/rejsekort.png', type: 'Rejsekort');
}

class SchoolCard extends TravelCard {
  SchoolCard({
    required String id,
  }) : super(id: id, image: 'assets/images/rejsekort.png', type: 'Skolekort');
}

class PendlerCard extends TravelCard {
  PendlerCard({
    required String id,
  }) : super(id: id, image: 'assets/images/pendler.png', type: 'Pendlerkort');
}

class YouthCard extends TravelCard {
  YouthCard({
    required String id,
    required String image,
  }) : super(id: id, image: image, type: 'Ungdomskort');
}

class ProfessionCard extends TravelCard {
  ProfessionCard({
    required String id,
    required String image,
  }) : super(id: id, image: image, type: 'Erhvervskort');
}
