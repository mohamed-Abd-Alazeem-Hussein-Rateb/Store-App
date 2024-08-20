import 'dart:convert';

import 'package:http/http.dart'as http;

class AddProductService {

  Future<void> addProduct(
      {required String id,
      required String title,
      required String price,
      required String category,
      required String description,
      required String image}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://fakestoreapi.com/products'),
        body: {
          'title': title,
          'price': price,
          'category': category,
          'description': description,
          'image': image
        },
      );
      var updatedProduct = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Product added successfully');
        print('added product details: $updatedProduct');
      } else {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to update product');
    }
  }
}