import 'package:flutter/material.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: TitlesTextWidget(label: "CartScreen"),
      ),
    );
  }
}