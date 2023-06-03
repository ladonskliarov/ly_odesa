import 'package:flutter/material.dart';
import 'package:ly_odesa/domain/providers/drawer_provider/drawer_provider.dart';
import 'package:ly_odesa/presentation/cart_screen/cart_screen.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
              onPressed: () {
                context.read<DrawerProvider>().showDrawer();
              },
              icon: const Icon(Icons.menu, size: 30)
          ),
        ),
        SizedBox(
            height: 60,
            width: 60,
            child: Image.asset('assets/images/brand/ly_dark.png', fit: BoxFit.scaleDown,)
        ),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<CartScreen>(builder:
                      (context) => const CartScreen(),
                  ),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined, size: 30)
        ),
      ],
    );
  }
}
