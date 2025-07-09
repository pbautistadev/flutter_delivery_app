import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';
import '../../../domain/model/product_cart.dart';

class CartBLoC extends ChangeNotifier {
  List<ProductCart> cartList = <ProductCart>[];
  int totalItems = 0;
  double totalPrice = 0.0;

  void add(Product product) {
    final temp = List<ProductCart>.from(cartList);
    // final List<ProductCart> temp = cartList.toList();
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product));
    }
    cartList = List<ProductCart>.from(temp);

    calculateTotal(temp);
  }

  void increment(ProductCart productCart) {
    productCart.quantity += 1;
    cartList = List<ProductCart>.from(cartList);
    calculateTotal(cartList);
  }

  void decrement(ProductCart productCart) {
    if (productCart.quantity > 1) {
      productCart.quantity -= 1;
      cartList = List<ProductCart>.from(cartList);
      calculateTotal(cartList);
    }
  }

  void calculateTotal(List<ProductCart> temp) {
    final total = temp.fold(
      0,
      (previousValue, element) => element.quantity + previousValue,
    );
    totalItems = total;

    final totalCost = temp.fold(
      0.0,
      (previousValue, element) =>
          (element.quantity * element.product.price) + previousValue,
    );
    totalPrice = totalCost;
    notifyListeners();
  }

  void deleteProduct(ProductCart productCart) {
    cartList.remove(productCart);
    calculateTotal(cartList);
  }
}
