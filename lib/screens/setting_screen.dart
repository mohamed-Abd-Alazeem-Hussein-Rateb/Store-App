import 'package:flutter/material.dart';
import 'package:storeapps/services/add_product.dart';
import 'package:storeapps/services/update_product.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            AddProductService().addProduct(
                id: '2',
                title: 'mohamed saeed',
                price: '10',
                category: 'electronics',
                description: 'هههههههههههههههاحا',
                image: 'احخخخخخخخخخخخخخخختين');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
