import 'package:flutter/material.dart';
import 'package:storeapps/services/add_product.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                TextField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'Enter product id',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Enter product title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Enter product price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Enter product category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Enter product description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(
                    labelText: 'Enter product image',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(500, 55)),
                    padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
                    shape: WidgetStateProperty.all(StadiumBorder()),
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    if (_titleController.text.isNotEmpty &&
                        _priceController.text.isNotEmpty &&
                        _categoryController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty) {
                      await AddProductService().addProduct(
                          id: _idController.text,
                          title: _titleController.text,
                          price: _priceController.text,
                          category: _categoryController.text,
                          description: _descriptionController.text,
                          image: _imageController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added successfully'),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter all fields'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Add Product',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
