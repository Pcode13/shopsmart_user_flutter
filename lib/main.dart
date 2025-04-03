import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/consts/theme_data.dart';
import 'package:shopsmart_user/providers/cart_provider.dart';
import 'package:shopsmart_user/providers/products_provider.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/root_screen.dart';
import 'package:shopsmart_user/screens/auth/forgot_password.dart';
import 'package:shopsmart_user/screens/auth/login.dart';
import 'package:shopsmart_user/screens/auth/register.dart';
import 'package:shopsmart_user/screens/inner_screen/orders/orders_screen.dart';
import 'package:shopsmart_user/screens/inner_screen/product_details.dart';
import 'package:shopsmart_user/screens/inner_screen/viewed_recently.dart';
import 'package:shopsmart_user/screens/inner_screen/wishlist.dart';
import 'package:shopsmart_user/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ThemeProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ProductsProvider();
          },
        ),
          ChangeNotifierProvider(create: (_) {
          return CartProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'ShopSmart EN',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme,
              context: context,
            ),
            home: RootScreen(),
            routes: {
              RootScreen.routeName: (context) => const RootScreen(),
              ProductDetailsScreen.routName:
                  (context) => const ProductDetailsScreen(),
              WishlistScreen.routName: (context) => const WishlistScreen(),
              ViewedRecentlyScreen.routName:
                  (context) => const ViewedRecentlyScreen(),
              RegisterScreen.routName: (context) => const RegisterScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
              ForgotPasswordScreen.routeName:
                  (context) => const ForgotPasswordScreen(),
              SearchScreen.routeName: (context) => const SearchScreen(),
            },
          );
        },
      ),
    );
  }
}
