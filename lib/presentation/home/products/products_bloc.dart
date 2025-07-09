import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';
import '../../../domain/repository/api_repository.dart';

class ProductsBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsBLoC({
    required this.apiRepositoryInterface,
  });

  List<Product> productList = <Product>[];

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList = result;
    notifyListeners();
  }
}
