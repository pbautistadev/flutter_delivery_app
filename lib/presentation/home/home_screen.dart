import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart/cart_bloc.dart';
import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeBLoC(
            apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
            localRepositoryInterface: context.read<LocalRepositoryInterface>(),
          )..loadUser(),
          builder: (_, __) => HomeScreen._(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected,
              children: [
                ProductsScreen.init(context),
                const Placeholder(),
                CartScreen(
                  onShopping: () {
                    bloc.updateIndexSelected(0);
                  },
                ),
                const Placeholder(),
                ProfileScreen.init(context),
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: bloc.indexSelected,
            onIndexSelected: (index) {
              bloc.updateIndexSelected(index);
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
    required this.index,
    required this.onIndexSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    final cartBloc = Provider.of<CartBLoC>(context);
    final user = bloc.user;
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
                    child: cartBloc.totalItems == 0
                        ? const SizedBox.shrink()
                        : CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.pinkAccent,
                            child: Text(
                              cartBloc.totalItems.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                child: user.image == null
                    ? SizedBox.shrink()
                    : CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(
                          user.image ?? '',
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
