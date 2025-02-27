import 'package:flutter/material.dart';
import 'package:shopnow/data/models/product.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_color.dart';
import 'package:shopnow/resources/app_theme.dart';
import 'package:shopnow/utils/util.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ✅ Aligns image to the top
        children: [
          /// Product Image with Icon
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 115,
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColor.grey09,
                    width: 1,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center, // Centers the image
                  children: [
                    /// Image (Centered)
                    Image.asset(
                      product.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),

                    /// Icon (Positioned to the Left)
                    Positioned(
                      left: 0, // Aligns the icon to the left
                      top: -2,
                      child: Image.asset(
                        product.iconTop,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

          SizedBox(width: 12),
          /// Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: textStyle.copyWith(
                      fontSize: 15,
                      color: AppColor.black01,
                      fontWeight: bold
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Text(
                  product.description1,
                  style: textStyle.copyWith(
                      fontSize: 13,
                      color: AppColor.black02,
                      fontWeight: medium
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.description2,
                  style: textStyle.copyWith(
                      fontSize: 13,
                      color: AppColor.black02,
                      fontWeight: medium
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  spacing: 3,
                  children: [
                    Icon(Icons.star, color: AppColor.yellow, size: 16),
                    Text(
                      product.rating,
                      style: TextStyle(fontSize: 13, color: AppColor.yellow),
                    ),
                    Text(
                      "(${product.count})",
                      style: TextStyle(fontSize: 13, color: AppColor.grey01),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColor.white02,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        product.category1,
                        style: textStyle.copyWith(
                          color: AppColor.grey02,
                          fontSize: 12
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColor.white02,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        product.category2,
                        style: textStyle.copyWith(
                            color: AppColor.grey02,
                            fontSize: 12
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
