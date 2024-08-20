import 'dart:convert';

import 'package:http/http.dart'as http;

class AllCategories{
  Future<List<String>> getAllCategories() async {
    try {
      http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        
        // تحويل List<dynamic> إلى List<String> باستخدام حلقة for
        List<String> categories = [];
        for (var category in data) {
          categories.add(category.toString());
        }
        
        // print(categories);
        return categories;
        
      } else {
        throw Exception('Failed to load categories with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load categories');
    }
  }
}