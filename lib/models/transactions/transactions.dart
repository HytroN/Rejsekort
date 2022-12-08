class Transactions {
  final String id;
  final String category;
  final String fromStation;
  final String toStation;
  final DateTime date;
  final double amount;

  Transactions({
    required this.id,
    required this.category,
    this.fromStation = "none",
    this.toStation = "none",
    required this.date,
    required this.amount,
  });
}
