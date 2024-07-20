import 'package:currency_converter/currency_module.dart';
import 'package:currency_converter/currency_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyProvider extends StateNotifier<CurrencyModule>{
  final Ref ref;
  CurrencyProvider(this.ref):super(CurrencyModule(currencyResult: '00', selectedCurrency: 'USD'));

  Future getCurrencyData(bool isforList)async
  {
    final currencyRate=await ref.read(CurrencyRepoProvider).getCurrencyList(isforList);
    state=state.copyWith(currencyRate: currencyRate);

  }
  calculateCurrencyData(String selectedCurrency,String number){
    final rate=state.currencyRate?[selectedCurrency];
    final inrCurrency=int.parse(number);
    final currencyResult=(inrCurrency * rate).toStringAsFixed(2);
    state=state.copyWith(currencyResult: currencyResult);

  }
  updateSelectedCurrency(String selectedCurrency){
    state=state.copyWith(selectedCurrency: selectedCurrency);
  }

}
final currencyProvider=StateNotifierProvider<CurrencyProvider,CurrencyModule>((ref)=>CurrencyProvider(ref));