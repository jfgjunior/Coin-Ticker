import 'package:flutter/material.dart';

class ConversorCard extends StatefulWidget {
  final String crypto;
  final String currency;
  final Future<String> price;

  ConversorCard({this.crypto, this.currency, this.price});

  @override
  State<StatefulWidget> createState() => ConverserCardState();
}

class ConverserCardState extends State<ConversorCard> {
  String price = "";

  @override
  Widget build(BuildContext context) {
    getPrice();
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.crypto} = $price ${widget.currency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void getPrice() async {
    final temp = await widget.price;
    setState(() {
      price = temp;
    });
  }
}
