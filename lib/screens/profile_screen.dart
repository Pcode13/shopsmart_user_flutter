import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/screens/auth/login.dart';
import 'package:shopsmart_user/screens/inner_screen/orders/orders_screen.dart';
import 'package:shopsmart_user/screens/inner_screen/viewed_recently.dart';
import 'package:shopsmart_user/screens/inner_screen/wishlist.dart';
import 'package:shopsmart_user/services/my_app_functions.dart';
import 'package:shopsmart_user/widgets/app_name_widgets.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';
import 'package:shopsmart_user/services/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart), // Fixed typo here
        ),
        title: AppNameWidgets(fontSize: 25),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: TitlesTextWidget(
                label: "Please login to have unlimited access",
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TitlesTextWidget(label: "Hadi Kachmar"),
                      SizedBox(height: 6),
                      SubtitleTextWidget(label: "Coding.with.hadi@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const TitlesTextWidget(label: "General"),
                const SizedBox(height: 10),
                CustomListTile(
                  text: "All Order",
                  imagePath: AssetsManager.orderSvg,
                  function: () {
                    Navigator.pushNamed(context, OrdersScreenFree.routeName);
                  },
                ),
                CustomListTile(
                  text: "Wishlist",
                  imagePath: AssetsManager.wishlistSvg,
                  function: () {
                    Navigator.pushNamed(context, WishlistScreen.routName);
                  },
                ),
                CustomListTile(
                  text: "Viewed recently",
                  imagePath: AssetsManager.recent,
                  function: () {
                    Navigator.pushNamed(context, ViewedRecentlyScreen.routName);
                  },
                ),
                CustomListTile(
                  text: "Address",
                  imagePath: AssetsManager.address,
                  function: () {},
                ),
                const SizedBox(height: 6),
                const Divider(thickness: 1),
                const SizedBox(height: 6),
                const TitlesTextWidget(label: "Settings"),
                const SizedBox(height: 10),
                SwitchListTile(
                  secondary: Image.asset(AssetsManager.theme, height: 34),
                  title: Text(
                    themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode",
                  ),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
                // await MyAppFunctions.showErrorOrWarningDialog(
                //   context: context,
                //   subtitle: "Are you sure you want to signout",
                //   fct: () {
                //     Navigator.pushNamed(context, LoginScreen.routeName);
                //   },
                //   isError: true,
                // );
              },
              icon: const Icon(Icons.login),
              label: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}

//
class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(imagePath, height: 34),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
