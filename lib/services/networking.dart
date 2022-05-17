import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {


  NetworkHelper();
  Future<dynamic> getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
      // double tenp = decodedData['main']['temp'];
      // int condition = decodedData['weather'][0]['id'];
      // String city = decodedData['name'];
      //
      // if (kDebugMode) {
      //   print(tenp);
      //   print(condition);
      //   print(city);
      // }
    } else {
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response reasonPhrase: ${response.reasonPhrase}');
        print('Response body: ${response.body}');

      }
    }
  }
}
