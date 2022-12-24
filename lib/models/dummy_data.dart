import 'package:rejsekort/models/cards/cards.dart';
import 'package:rejsekort/models/generate_ids.dart';

import 'transactions/transactions.dart';

final List<TravelCard> travelCards = [
  TravelCard(
    id: generateId(16),
    money: 0,
  ),
];

// ignore: non_constant_identifier_names
final USER_TRANSACTIONS = [
  Transactions(
    id: "c1",
    isTransport: true,
    fromStation: "Høje Taastrup",
    toStation: "København H",
    date: DateTime.utc(2022, 7, 7, 17, 00),
    amount: 32.0,
  ),
  Transactions(
    id: "c2",
    isTransport: true,
    fromStation: "København H",
    toStation: "Høje Taastrup",
    date: DateTime.utc(2022, 7, 7, 17, 30),
    amount: 40.0,
  ),
  Transactions(
    id: "c3",
    isTransport: true,
    fromStation: "Valby",
    toStation: "Danshøj",
    date: DateTime.utc(2022, 7, 9, 16, 56),
    amount: 20.0,
  ),
  Transactions(
    id: "c4",
    isTransport: true,
    fromStation: "Danshøj",
    toStation: "Valby",
    date: DateTime.utc(2022, 7, 9, 17, 27),
    amount: 20.0,
  ),
  Transactions(
    id: "c5",
    isTransport: true,
    fromStation: "Høje Taastrup",
    toStation: "København H",
    date: DateTime.utc(2022, 7, 12, 12, 22),
    amount: 32.0,
  ),
  Transactions(
    id: "c6",
    isTransport: true,
    fromStation: "København H",
    toStation: "Høje Taastrup",
    date: DateTime.utc(2022, 7, 12, 12, 56),
    amount: 40.0,
  ),
  Transactions(
    id: "c7",
    isTransport: true,
    fromStation: "Valby",
    toStation: "Danshøj",
    date: DateTime.utc(2022, 7, 15, 19, 10),
    amount: 20.0,
  ),
  Transactions(
    id: "c8",
    isTransport: true,
    fromStation: "Danshøj",
    toStation: "Valby",
    date: DateTime.utc(2022, 7, 15, 19, 27),
    amount: 20.0,
  ),
  Transactions(
    id: "c9",
    isTransport: false,
    date: DateTime.utc(2022, 7, 16, 22, 58),
    amount: 20.0,
  ),
];
