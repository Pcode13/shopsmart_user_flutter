import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_user/consts/app_constants.dart';
import 'package:shopsmart_user/screens/inner_screen/product_details.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, this.image, this.title, this.price});
  final String? image, title, price;
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
          Navigator.pushNamed(context, ProductDetailsScreen.routName);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: widget.image ?? AppConstants.imageUrl,
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
                    child: TitlesTextWidget(
                      label: widget.title ?? "Title " * 10,
                      fontSize: 18,
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
                    child: SubtitleTextWidget(
                      label: "${widget.price}\$" ?? "1550.00\$",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
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
