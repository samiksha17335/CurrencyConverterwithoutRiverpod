
class CurrencyModule{
  final Map<String,dynamic>? currencyRate;
  String currencyResult;
  String selectedCurrency;

  CurrencyModule({
    this.currencyRate,
    required this.currencyResult,
    required this.selectedCurrency
  } );

  CurrencyModule copyWith({
     Map<String,dynamic>? currencyRate,
    String? currencyResult,
    String? selectedCurrency,
  }) {
    return CurrencyModule(
        currencyRate: currencyRate ?? this.currencyRate,
        currencyResult: currencyResult ?? this.currencyResult,
        selectedCurrency: selectedCurrency ?? this.selectedCurrency);
  }
}
