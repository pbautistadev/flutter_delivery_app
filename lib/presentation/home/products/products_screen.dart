import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/presentation/home/products/products_bloc.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/product.dart';
import '../cart/cart_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsBLoC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
      )..loadProducts(),
      builder: (_, __) => ProductsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsBloc = context.watch<ProductsBLoC>();
    final cartBloc = context.watch<CartBLoC>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: productsBloc.productList.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: productsBloc.productList.length,
              itemBuilder: (context, index) {
                final product = productsBloc.productList[index];
                return _ItemProduct(
                  product: product,
                  onTap: () {
                    cartBloc.add(product);
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({required this.product, required this.onTap});
  final Product product;
  final VoidCallback onTap;

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
              onTap: onTap,
              text: 'Add',
              padding: const EdgeInsets.symmetric(vertical: 4),
            ),
          ],
        ),
      ),
    );
  }
}
