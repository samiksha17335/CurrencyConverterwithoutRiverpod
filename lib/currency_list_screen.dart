import 'package:currency_converter/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyListScreen extends ConsumerStatefulWidget {
  const CurrencyListScreen({super.key,
    //required this.currencyRate
  });
  //final Map<String,dynamic> currencyRate;
  @override
  ConsumerState<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends ConsumerState<CurrencyListScreen> {
  List currencyList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //currencyList=widget.currencyRate.entries.toList();
    ref.read(currencyProvider.notifier).getCurrencyData(true);
    final currencyNotifier=ref.read(currencyProvider);
    currencyList=currencyNotifier.currencyRate!.entries.toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Currency List",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white

        ),),

        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
          itemCount: currencyList.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: ListTile(
                    leading: const Icon(Icons.monetization_on,
                    color: Colors.white,),
                    title: Text("${currencyList[index].key}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),

                    subtitle: Text("${currencyList[index].value}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        //fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                ),

            Container(
              width: double.infinity,
              height: 1,
              color: Colors.white,
            ),
            ]
            );

          }
      ),
    );
  }
}
