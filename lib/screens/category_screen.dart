import 'package:flutter/material.dart';
import 'package:storeapps/models/product_modle.dart';

import 'package:storeapps/services/get_category.dart';
import 'package:storeapps/widgets/card_wiget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in $categoryName'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetCategoryService().getCategory(category_name: categoryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<ProductModel> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5,top: 66),
                child: GridView.builder(
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                          mainAxisSpacing: 100, // تصغير المسافة بين العناصر
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return CardWidget(product: products[index]);
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

