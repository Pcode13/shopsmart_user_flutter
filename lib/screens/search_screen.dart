import 'package:flutter/material.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TitlesTextWidget(label: "SearchScreen")),
    );
  }
}
