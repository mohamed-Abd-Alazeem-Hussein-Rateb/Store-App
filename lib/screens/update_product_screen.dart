import 'package:flutter/material.dart';
import 'package:storeapps/models/product_modle.dart';
import 'package:storeapps/services/update_product.dart';

class UpdateProductScreen extends StatelessWidget {
  UpdateProductScreen({Key? key, this.product}) : super(key: key);
  ProductModel? product;
   final _titleController = TextEditingController();
   final _priceController = TextEditingController();
   final _categoryController = TextEditingController();
   final _descriptionController = TextEditingController();
    final _imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (product != null) {
      _titleController.text = product!.title;
      _priceController.text = product!.price.toString();
      _categoryController.text = product!.category;
      _descriptionController.text = product!.description;
      _imageController.text = product!.image;
    } else {
      print('Product is null');
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: ListView(
          children: [
          const  SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                   TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Enter product title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                const  SizedBox(
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
                const  SizedBox(
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
                      padding:
                          WidgetStateProperty.all(const EdgeInsets.all(15)),
                      shape: WidgetStateProperty.all(StadiumBorder()),
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    onPressed: () async {
                      
                      if(_titleController.text.isNotEmpty&&_priceController.text.isNotEmpty&&_categoryController.text.isNotEmpty&&_descriptionController.text.isNotEmpty){
                        await UpdateProductService().updateProduct(
                         id: product!.id.toString(),
                         title: _titleController.text,
                         price: _priceController.text,
                         category: _categoryController.text,
                         description: _descriptionController.text,
                         image: _imageController.text,
                       );
                       ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product updated successfully'),
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
                      'Update Product',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        );
  }
}
