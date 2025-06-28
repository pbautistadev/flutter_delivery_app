import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                ProductsScreen(),
                Text('currentIndex 2: $currentIndex'),
                CartScreen(
                  onShopping: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                Text('currentIndex 4: $currentIndex'),
                ProfileScreen(),
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: currentIndex,
            onIndexSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  const _DeliveryNavigationBar({
    super.key,
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
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
