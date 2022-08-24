import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import '../additions/consts.dart';

class FetchHelper {
  final String baseUrl;
  final int limit;

  FetchHelper({
    this.baseUrl = Consts.baseUrl,
    this.limit = Consts.phonesLimit,
  });

  Future<dynamic> getBaseData() async {
    print('Request1...');

    http.Response response = await http.get(Uri.parse(Consts.baseUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('Response:\n$body');
      return body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getPhoneData() async {
    print('Request2...');

    http.Response response = await http.get(Uri.parse(Consts.phoneUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('Response:\n$body');
      return body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getCartData() async {
    print('Request3...');

    http.Response response = await http.get(Uri.parse(Consts.basketUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('Response:\n$body');
      return body;
    } else {
      print(response.statusCode);
    }
  }
}
