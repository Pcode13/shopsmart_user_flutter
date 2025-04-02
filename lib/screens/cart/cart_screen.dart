import 'package:flutter/material.dart';
import 'package:shopsmart_user/screens/cart/bottom_checkout.dart';
import 'package:shopsmart_user/screens/cart/cart_widget.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/widgets/empty_bag.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
          body: Center(
            child: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Your cart is empty",
              subtitle:
                  "Looks like your cart is empty add something and make me happy",
              buttonText: "Shop Now",
            ),
          ),
        )
        : Scaffold(
                 bottomSheet: CartBottomSheetWidget(),
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetsManager.shoppingCart),
            ),
            title: const TitlesTextWidget(label: "Cart (6)"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CartWidget();
            },
          ),
        );
  }
}
