import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class AppNameWidgets extends StatelessWidget {
  const AppNameWidgets({Key? key, this.fontSize = 30}) : super(key: key);
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 22),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitlesTextWidget(label: "Shop smart", fontSize: fontSize),
    );
  }
}
