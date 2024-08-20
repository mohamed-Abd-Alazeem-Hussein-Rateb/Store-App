import 'package:flutter/material.dart';
import 'package:storeapps/models/product_modle.dart';
import 'package:storeapps/screens/add_product_screen.dart';
import 'package:storeapps/screens/category_screen.dart';
import 'package:storeapps/services/get_all_categories.dart';
import 'package:storeapps/services/get_all_product.dart';

import 'package:storeapps/widgets/card_wiget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store App'),
        actions: [
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  AddProductScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add_card,
               size: 32,
              ),
            ),
          ),

        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<String>>(
              future: AllCategories().getAllCategories(),
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
                  List<String> categories = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 10, right: 10, bottom: 66),
                    child: SizedBox(
                      height: 76,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                      categoryName: categories[index]),
                                ),
                              ); // هنا يمكنك إضافة وظيفة التصفية حسب الفئة عند النقر
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 58,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade300,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    categories[index],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            FutureBuilder<List<ProductModel>>(
              future: GetAllProduct().getProducts(),
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
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: GridView.builder(
                      shrinkWrap: true, // مهم لتناسب الحجم مع حجم المحتوى
                      physics:
                         const NeverScrollableScrollPhysics(), // منع التمرير الداخلي
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 100, // تصغير المسافة بين العناصر
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.2, // ضبط نسبة الطول إلى العرض
                      ),
                      itemBuilder: (context, index) {
                        return CardWidget(product: products[index]);
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
