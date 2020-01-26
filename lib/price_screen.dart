import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/conversor_card.dart';
import 'package:bitcoin_ticker/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = currenciesList[0];
  final repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConversorCard(
                crypto: "BTC",
                currency: currency,
                price: repository.getPrice("BTC", currency),
              ),
              ConversorCard(
                crypto: "ETH",
                currency: currency,
                price: repository.getPrice("ETH", currency),
              ),
              ConversorCard(
                crypto: "LTC",
                currency: currency,
                price: repository.getPrice("LTC", currency),
              ),
            ],
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: platformPicker),
        ],
      ),
    );
  }

  Widget get dropdownButton => DropdownButton(
        items: currencyItemsList,
        onChanged: (value) => setState(() {
          currency = value;
        }),
        value: currency,
      );

  Widget get cupertinoPicker => CupertinoPicker(
        children: currencyItemsList,
        onSelectedItemChanged: (index) => setState(() {
          currency = currenciesList[index];
        }),
        itemExtent: 32,
        backgroundColor: Colors.lightBlue,
      );

  List<Widget> get currencyItemsList => (Platform.isIOS)
      ? currenciesList
          .map(((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )))
          .toList()
      : currenciesList.map(((item) => Text(item))).toList();

  Widget get platformPicker =>
      (Platform.isIOS) ? dropdownButton : cupertinoPicker;
}
