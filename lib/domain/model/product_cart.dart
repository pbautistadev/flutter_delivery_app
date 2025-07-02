import 'product.dart';

class ProductCart {
  final Product product;
  int quantity;

  ProductCart({required this.product, this.quantity = 1});
}
