import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_user/consts/app_constants.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          print("ToDo add the navigate to the product details screen");
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: AppConstants.imageUrl,
                height: 200,
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Text(
                      "Product Title",
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Text(
                      "\$99.99",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
