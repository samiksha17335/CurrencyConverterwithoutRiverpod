import 'dart:convert';
import 'dart:developer';

import 'package:currency_converter/constants.dart';
import 'package:currency_converter/currency_converter_screen.dart';
import 'package:currency_converter/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  //Map<String,dynamic> currencyRate={};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrencyData();
    Future.microtask(()async{
      await ref.read(currencyProvider.notifier).getCurrencyData(false).then((value){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CurrencyConverterScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/currency.png',height: 200,width: 200,),

            ),
            const Text("Currency Converter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),)
          ],
      )
    );
  }

  /*Future getCurrenciesList() async{
    String url='https://api.freecurrencyapi.com/v1/currencies?apikey=$currency_api_key&';
    Uri uri=Uri.parse(url);
    final response=await http.get(uri);
    final decodeData=jsonDecode(response.body);
    print(response.body);
    log(decodeData.toString());
  }
  Future getCurrencyData()async{
    String url='https://api.freecurrencyapi.com/v1/latest?apikey=$currency_api_key&base_currency=INR';
    Uri uri=Uri.parse(url);
    //final response=await http.get(uri);
    await http.get(uri).then((response) {
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        currencyRate = decodeData['data'];

        log(currencyRate.toString());

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) =>  CurrencyConverterScreen(currencyRate:decodeData['data'],)),
                (route) => false);
      }
      else {

      }
    }).catchError((error){
      log("failed to load data $error");
    });

   /* final decodeData=jsonDecode(response.body);
    currencyRate=decodeData['data'];

    log(currencyRate.toString());*/
    //print(response.body);
    //log(decodeData.body);

  }*/

}
