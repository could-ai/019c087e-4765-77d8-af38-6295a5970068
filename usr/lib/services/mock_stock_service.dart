import 'dart:math';
import '../models/stock.dart';

class MockStockService {
  static final List<String> _nifty50Symbols = [
    "ADANIENT", "ADANIPORTS", "APOLLOHOSP", "ASIANPAINT", "AXISBANK",
    "BAJAJ-AUTO", "BAJFINANCE", "BAJAJFINSV", "BPCL", "BHARTIARTL",
    "BRITANNIA", "CIPLA", "COALINDIA", "DIVISLAB", "DRREDDY",
    "EICHERMOT", "GRASIM", "HCLTECH", "HDFCBANK", "HDFCLIFE",
    "HEROMOTOCO", "HINDALCO", "HINDUNILVR", "ICICIBANK", "INDUSINDBK",
    "INFY", "ITC", "JSWSTEEL", "KOTAKBANK", "LT",
    "LTIM", "M&M", "MARUTI", "NESTLEIND", "NTPC",
    "ONGC", "POWERGRID", "RELIANCE", "SBILIFE", "SBIN",
    "SUNPHARMA", "TATACONSUM", "TATAMOTORS", "TATASTEEL", "TCS",
    "TECHM", "TITAN", "ULTRACEMCO", "UPL", "WIPRO"
  ];

  static final List<String> _companyNames = [
    "Adani Enterprises Ltd.", "Adani Ports and SEZ Ltd.", "Apollo Hospitals", "Asian Paints Ltd.", "Axis Bank Ltd.",
    "Bajaj Auto Ltd.", "Bajaj Finance Ltd.", "Bajaj Finserv Ltd.", "Bharat Petroleum", "Bharti Airtel Ltd.",
    "Britannia Industries", "Cipla Ltd.", "Coal India Ltd.", "Divi's Laboratories", "Dr. Reddy's Labs",
    "Eicher Motors Ltd.", "Grasim Industries", "HCL Technologies", "HDFC Bank Ltd.", "HDFC Life Insurance",
    "Hero MotoCorp Ltd.", "Hindalco Industries", "Hindustan Unilever", "ICICI Bank Ltd.", "IndusInd Bank Ltd.",
    "Infosys Ltd.", "ITC Ltd.", "JSW Steel Ltd.", "Kotak Mahindra Bank", "Larsen & Toubro",
    "LTIMindtree Ltd.", "Mahindra & Mahindra", "Maruti Suzuki India", "Nestle India Ltd.", "NTPC Ltd.",
    "ONGC Ltd.", "Power Grid Corp", "Reliance Industries", "SBI Life Insurance", "State Bank of India",
    "Sun Pharma Inds.", "Tata Consumer Products", "Tata Motors Ltd.", "Tata Steel Ltd.", "TCS Ltd.",
    "Tech Mahindra Ltd.", "Titan Company Ltd.", "UltraTech Cement", "UPL Ltd.", "Wipro Ltd."
  ];

  Future<List<Stock>> getNifty50Stocks() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final random = Random();
    List<Stock> stocks = [];

    for (int i = 0; i < _nifty50Symbols.length; i++) {
      // Generate realistic looking stock prices (between 500 and 5000 approx)
      double basePrice = 500 + random.nextDouble() * 4500;
      
      // Random volatility for the day
      double volatility = basePrice * 0.02; // 2% volatility
      
      double open = basePrice + (random.nextDouble() * volatility - volatility/2);
      double close = basePrice + (random.nextDouble() * volatility - volatility/2);
      
      // High should be max of open, close and some random upper wick
      double high = max(open, close) + random.nextDouble() * (volatility / 2);
      
      // Low should be min of open, close and some random lower wick
      double low = min(open, close) - random.nextDouble() * (volatility / 2);
      
      double previousClose = basePrice; // Using base as prev close for simplicity of calc
      
      // Monthly average change (random between -5% to +5%)
      double monthlyAvg = (random.nextDouble() * 10) - 5;

      stocks.add(Stock(
        symbol: _nifty50Symbols[i],
        companyName: _companyNames[i],
        open: double.parse(open.toStringAsFixed(2)),
        high: double.parse(high.toStringAsFixed(2)),
        low: double.parse(low.toStringAsFixed(2)),
        close: double.parse(close.toStringAsFixed(2)),
        previousClose: double.parse(previousClose.toStringAsFixed(2)),
        monthlyAvgChangePercent: double.parse(monthlyAvg.toStringAsFixed(2)),
      ));
    }

    return stocks;
  }
}
