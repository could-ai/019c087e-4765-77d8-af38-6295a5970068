class Stock {
  final String symbol;
  final String companyName;
  final double open;
  final double high;
  final double low;
  final double close;
  final double previousClose;
  final double monthlyAvgChangePercent;

  Stock({
    required this.symbol,
    required this.companyName,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.previousClose,
    required this.monthlyAvgChangePercent,
  });

  double get dailyChange => close - previousClose;
  double get dailyChangePercent => (dailyChange / previousClose) * 100;
}
