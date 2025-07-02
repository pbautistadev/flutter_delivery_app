import 'package:delivery_app/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/presentation/home/products/products_controller.dart';
import 'package:get/instance_manager.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localRepositoryInterface: Get.find(),
        apiRepositoryInterface: Get.find(),
      ),
    );
    Get.lazyPut(
      () => ProductsController(
        apiRepositoryInterface: Get.find(),
      ),
    );

    Get.lazyPut(
      () => CartController(),
    );
  }
}
