import 'dart:convert';

import 'package:http/http.dart' as http;

class UpdateProductService {
  Future<void> updateProduct(
      {required String id,
      required String title,
      required String price,
      required String category,
      required String description,
      required String image}) async {
    try {
      http.Response response = await http.put(
        Uri.parse('https://fakestoreapi.com/products/$id'),
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
        print('Product updated successfully');
        print('Updated product details: $updatedProduct');
      } else {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to update product');
    }
  }
}
