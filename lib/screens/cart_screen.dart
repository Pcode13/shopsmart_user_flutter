import 'package:flutter/material.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/widgets/empty_bag.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EmptyBagWidget(
          imagePath: AssetsManager.shoppingBasket,
          title: "Your cart is empty",
          subtitle:
              "Looks like your cart is empty add something and make me happy",
          buttonText: "Shop Now",
        ),
      ),
    );
  }
}
