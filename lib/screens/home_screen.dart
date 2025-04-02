import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print("Dark Mode: ${themeProvider.getIsDarkTheme}");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello world",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Hello world")),
            SwitchListTile(
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
    );
  }
}
