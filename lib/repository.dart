import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {
  String price = "0.00";

  Future<String> getPrice(String cryto, String currency) async {
    print("made call");
    String url =
        "https://apiv2.bitcoinaverage.com/indices/global/ticker/$cryto$currency";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["last"] as double).toStringAsFixed(2);
    }
    return "Err.";
  }
}
