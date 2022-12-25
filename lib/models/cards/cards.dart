// class TravelCard {
//   final String id;
//   final String type;
//   final String image;
//   double money;

//   TravelCard({
//     required this.id,
//     this.type = 'Rejsekort',
//     this.image = 'assets/images/rejsekort.png',
//     required this.money,
//   });

//   Map<String, dynamic> getMap() {
//     return {
//       'id': id,
//       'type': type,
//       'image': image,
//       'money': money,
//     };
//   }

//   double? get getMoney => money;
//   set setMoney(double? newMoney) => money = newMoney as double;
// }

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TravelCard {
  final String id;
  final String type;
  final String image;

  TravelCard({
    required this.id,
    required this.type,
    required this.image,
  });

  Map<String, dynamic> getMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
    };
  }

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
  Map<String, dynamic> getMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
      'money': money,
    };
  }

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
  Map<String, dynamic> getMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
    };
  }

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
  Map<String, dynamic> getMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
    };
  }

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
  Map<String, dynamic> getMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
    };
  }

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
  Map<String, dynamic> getMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
    };
  }

  @override
  double? get money => null;

  @override
  set setMoney(double? newMoney) => null;
}
