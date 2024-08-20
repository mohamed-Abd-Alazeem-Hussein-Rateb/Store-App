import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:storeapps/models/product_modle.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategory({required String category_name}) async {
    try {
      http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category_name'));
      if (response.statusCode == 200) {
        var responseBody = response.body;
        List<dynamic> data = jsonDecode(responseBody);
        List<ProductModel> category = [];
        for (var item in data) {
          category.add(ProductModel.fromJson(item));
        }
        // print(category);
        return category;
      } else {
        throw Exception('Failed to load products with status code: ${response.statusCode}');
      }
  } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load products');
    }
  }
}