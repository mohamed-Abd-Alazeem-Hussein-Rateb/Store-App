 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeapps/models/product_modle.dart';
class GetAllProduct {
  Future<List<ProductModel>> getProducts() async {
    try {
      http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var responseBody = response.body;
        List<dynamic> data = jsonDecode(responseBody);
       
        List<ProductModel> products = [];
        for (var item in data) {
          products.add(ProductModel.fromJson(item));
        }
        return products;
      } else {
        throw Exception('Failed to load products with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load products');
    }
  }
}
