import 'package:flutter/material.dart';
import 'package:storeapps/models/product_modle.dart';
import 'package:storeapps/screens/update_product_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProductScreen(product: product)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
      
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(color: Colors.black, fontSize: 17),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -85,
              left: 55,
              
              child: Image.network(product.image,
                height: 113,
                width: 96,
                
                fit: BoxFit.fill,
                ),
            ),
          ],
        ),
      ),
    );
  }
}