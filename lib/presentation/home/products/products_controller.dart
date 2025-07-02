import 'package:get/get.dart';

import '../../../domain/model/product.dart';
import '../../../domain/repository/api_repository.dart';

class ProductsController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({
    required this.apiRepositoryInterface,
  });

  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList.value = result;
  }
}
