import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:assignment1/api/url.dart';
import 'package:assignment1/models/products.dart';
import 'package:http/http.dart' as http;

class Api {
  static var _client = http.Client();

  // Get List of Products
  static Future<List<ProductList>> getProducts() async {
    Products products;
    var response = await _client.get(Uri.parse(Url.baseUrl));
    debugPrint("Status Code: " + response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        products = Products.fromJson(userMap);
        print(products.productList);
        return products.productList!;
      }
    } catch (e) {
      throw e;
    }
    return [];
  }
}
