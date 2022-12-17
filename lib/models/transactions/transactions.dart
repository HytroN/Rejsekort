class Transactions {
  final String id;
  final bool isTransport;
  final String fromStation;
  final String toStation;
  final DateTime date;
  final double amount;

  Transactions({
    required this.id,
    required this.isTransport,
    this.fromStation = "none",
    this.toStation = "none",
    required this.date,
    required this.amount,
  });
}
