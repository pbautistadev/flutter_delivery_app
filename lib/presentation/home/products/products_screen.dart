import 'package:delivery_app/data/in_memory_products.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _ItemProduct(
            product: product,
          );
        },
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: DeliveryColors.lightGrey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${product.price} USD',
                    style: TextStyle(
                      color: Theme.of(context).copyWith().colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              onTap: () {},
              text: 'Add',
              padding: const EdgeInsets.symmetric(vertical: 4),
            ),
          ],
        ),
      ),
    );
  }
}
