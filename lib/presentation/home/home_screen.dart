import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'cart/cart_controller.dart';
import 'home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(() {
              return IndexedStack(
                index: controller.indexSelected.value,
                children: [
                  ProductsScreen(),
                  const Placeholder(),
                  CartScreen(
                    onShopping: () {
                      // setState(() {
                      //   currentIndex = 0;
                      // });
                      controller.indexSelected.value = 0;
                    },
                  ),
                  const Placeholder(),
                  ProfileScreen(),
                ],
              );
            }),
          ),
          Obx(() {
            return _DeliveryNavigationBar(
              index: controller.indexSelected.value,
              onIndexSelected: (index) {
                controller.updateIndexSelected(index);
                // setState(() {
                //   currentIndex = index;
                // });
              },
            );
          }),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  _DeliveryNavigationBar({
    required this.index,
    required this.onIndexSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).bottomAppBarTheme.color!,
            width: 2,
          ),
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => onIndexSelected(0),
                icon: Icon(
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                  Icons.home,
                ),
              ),
              IconButton(
                onPressed: () => onIndexSelected(1),
                icon: Icon(
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                  Icons.store,
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: DeliveryColors.purple,
                    child: IconButton(
                      onPressed: () => onIndexSelected(2),
                      icon: Icon(
                        color: index == 2
                            ? DeliveryColors.green
                            : DeliveryColors.white,
                        Icons.shopping_basket,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(
                      () => cartController.totalItems.value == 0
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.pinkAccent,
                              child: Text(
                                cartController.totalItems.value.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => onIndexSelected(3),
                icon: Icon(
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                  Icons.favorite_border,
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: Obx(
                  () {
                    final user = controller.user.value;
                    return user.image == null
                        ? SizedBox.shrink()
                        : CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              user.image ?? '',
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
