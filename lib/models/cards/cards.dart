abstract class TravelCard {
  final String id;
  final String type;
  final String image;

  TravelCard({
    required this.id,
    required this.type,
    required this.image,
  });

  double? get money;
  set setMoney(double? newMoney);
}

class Rejsekort extends TravelCard {
  double money;

  Rejsekort({
    required String id,
    required this.money,
  }) : super(id: id, image: 'assets/images/rejsekort.png', type: 'Rejsekort');

  @override
  double? get getMoney => money;

  @override
  set setMoney(double? newMoney) => money = newMoney as double;
}

class SchoolCard extends TravelCard {
  SchoolCard({
    required String id,
  }) : super(id: id, image: 'assets/images/rejsekort.png', type: 'Skolekort');

  @override
  double? get money => null;

  @override
  set setMoney(double? newMoney) => null;
}

class PendlerCard extends TravelCard {
  PendlerCard({
    required String id,
  }) : super(id: id, image: 'assets/images/pendler.png', type: 'Pendlerkort');

  @override
  double? get money => null;

  @override
  set setMoney(double? newMoney) => null;
}

class YouthCard extends TravelCard {
  YouthCard({
    required String id,
    required String image,
  }) : super(id: id, image: image, type: 'Ungdomskort');

  @override
  double? get money => null;

  @override
  set setMoney(double? newMoney) => null;
}

class ProfessionCard extends TravelCard {
  ProfessionCard({
    required String id,
    required String image,
  }) : super(id: id, image: image, type: 'Erhvervskort');

  @override
  double? get money => null;

  @override
  set setMoney(double? newMoney) => null;
}
