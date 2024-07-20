import 'package:currency_converter/currency_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CurrencyConverterScreen extends StatefulWidget {
  CurrencyConverterScreen({super.key, required this.currencyRate});
  final Map<String,dynamic> currencyRate;
  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    dropdownItems=widget.currencyRate.entries.map((e){
      return DropdownMenuItem(child: Text(e.key),
      value: e.key);

    }).toList();

  }
  List<DropdownMenuItem> dropdownItems=[];
  final currencyTextEditingController=TextEditingController();
  String currencyResult='0.0';
  String selectedCurrency="USD";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blue,
      appBar: AppBar(
      backgroundColor: Colors.blue,
        title:const Text("Currency Converter",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
            CurrencyListScreen(currencyRate: widget.currencyRate)));
          },
          icon: const Icon(Icons.currency_bitcoin))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('INR: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              Container(
                width: 100,
                child: Center(
                  child: TextField(
                    controller: currencyTextEditingController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)
                        )
                      ),
                      fillColor: Colors.blue,
                      filled: true
                    ),
                  ),
                ),
              ),
              DropdownButton(
                iconEnabledColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                dropdownColor: Colors.blue,
                value: selectedCurrency,
                  items: dropdownItems, onChanged: (value){
                selectedCurrency=value.toString();
                setState(() {

                });
              }),
              Text(currencyResult,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                final rate=widget.currencyRate[selectedCurrency];
                if(currencyTextEditingController.text.isEmpty){
                  return;
                }
                final inrCurrency=int.parse(currencyTextEditingController.text);
                currencyResult=(inrCurrency*rate).toStringAsFixed(2);
                setState(() {

                });
              }, child: const Text("convert",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),)),
            ),
          )
        ],
      )

    );
  }
}
