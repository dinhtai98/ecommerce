class CurrencyUtils {
  static double currencyRound(double value) {
    return (value * 100).round() / 100.0;
  }

  static String getCurrencyString(String currencyCode, double value) {
    return (value < 0 ? '-' : '') + currencyCode + value.abs().toStringAsFixed(2);
  }
}
