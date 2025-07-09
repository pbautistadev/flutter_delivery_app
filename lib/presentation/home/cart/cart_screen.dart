import 'package:delivery_app/presentation/home/cart/cart_bloc.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/product_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.onShopping});

  final VoidCallback? onShopping;

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.watch<CartBLoC>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: cartBloc.totalItems == 0
          ? _EmptyCart(
              onShopping: onShopping,
            )
          : _FullCart(),
      // _EmptyCart(
      //   onShopping: onShopping,
      // ),
    );
  }
}

class _FullCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = context.watch<CartBLoC>();
    final totalPrice = cartBloc.totalPrice.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: cartBloc.cartList.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 230,
              itemBuilder: (context, index) {
                final productCart = cartBloc.cartList[index];
                return _ShoppingCartProduct(
                  productCart: productCart,
                  onDelete: () {
                    cartBloc.deleteProduct(productCart);
                  },
                  onIncrement: () {
                    cartBloc.increment(productCart);
                  },
                  onDecrement: () {
                    cartBloc.decrement(productCart);
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Theme.of(context).canvasColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub total',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).copyWith().colorScheme.secondary,
                                  ),
                            ),
                            Text(
                              '0.0 usd',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).copyWith().colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).copyWith().colorScheme.secondary,
                                  ),
                            ),
                            Text(
                              'Free',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).copyWith().colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).copyWith().colorScheme.secondary,
                              ),
                            ),
                            Text(
                              '\$$totalPrice usd',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).copyWith().colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                  DeliveryButton(onTap: () {}, text: 'Checkout'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct({
    required this.productCart,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    final product = productCart.product;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          product.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: DeliveryColors.lightGrey,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: onDecrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: DeliveryColors.white,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: DeliveryColors.purple,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(productCart.quantity.toString()),
                              ),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: DeliveryColors.purple,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: DeliveryColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                foregroundColor: DeliveryColors.white,
                child: Icon(
                  Icons.delete_outline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({this.onShopping});

  final VoidCallback? onShopping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/image.png',
          height: 90,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'There are no products',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).copyWith().colorScheme.secondary,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: DeliveryColors.purple,
            ),
            onPressed: onShopping,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Go shopping',
                style: TextStyle(
                  color: DeliveryColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
