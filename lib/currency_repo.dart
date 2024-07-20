import 'dart:convert';
import 'dart:developer';

import 'package:currency_converter/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
class CurrencyRepo{
  var currencyRate;

  Future<Map<String,dynamic>> getCurrencyList(bool isforList)async{
    String url;
    if(isforList){
      url='https://api.freecurrencyapi.com/v1/currencies?apikey=$currency_api_key';

    }
    else{
      url='https://api.freecurrencyapi.com/v1/latest?apikey=$currency_api_key&base_currency=INR';

    }
    Uri uri=Uri.parse(url);
    await http.get(uri).then((response){
      if(response.statusCode==200){
        final decodedData=jsonDecode(response.body);
        currencyRate=decodedData['data'];
      }
      else{
        //handle status as per code
        //statuscode=401
      }
    }).catchError((error){
      log("failed to get data$error");
    });
    return currencyRate;

  }
}
final CurrencyRepoProvider=Provider((ref)=>CurrencyRepo());