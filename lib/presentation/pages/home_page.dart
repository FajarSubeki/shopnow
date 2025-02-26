import 'package:flutter/material.dart';
import 'package:shopnow/data/datasource/dummy_data.dart';
import 'package:shopnow/presentation/components/gradient_text_field.dart';
import 'package:shopnow/presentation/components/image_slider.dart';
import 'package:shopnow/presentation/components/product_item.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_color.dart';
import 'package:shopnow/resources/app_string.dart';
import 'package:shopnow/resources/app_theme.dart';
import 'package:shopnow/utils/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Ensures the whole page scrolls
          physics: ClampingScrollPhysics(),
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gradientTextField(),
              bannerSlider(),
              topProduct(), // Ensure this is properly constrained
            ],
          ),
        ),
      ),
    );
  }

  Widget gradientTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 26, left: 18, right: 18),
        child: GradientTextField(
        hintText: AppString.search,
        icon: Icons.search,
        controller: TextEditingController(),
      ),
    );
  }

  Widget bannerSlider() {
    return ImageSlider();
  }

  Widget topProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleIcon(),
        ListView.builder(
          shrinkWrap: true, // ✅ Important: Makes ListView take only needed space
          physics: NeverScrollableScrollPhysics(), // ✅ Disable inner scrolling
          itemCount: DummyData.products.length,
          itemBuilder: (context, index) {
            return ProductItem(product: DummyData.products[index]);
          },
        ),
      ],
    );
  }

  Widget titleIcon() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          /// Left Labels
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                Text(
                    AppString.reviewTitle,
                    style: textStyle.copyWith(
                        color: AppColor.grey03,
                        fontSize: 12
                    )
                ),
                SizedBox(height: 4),
                Text(
                  AppString.reviewSubTitle,
                  style: TextStyle(fontSize: 18, color: AppColor.black01),
                ),
              ],
            ),
          ),

          /// Right Icon (Vertically Centered)
          Util.buildSvgIcon(
              AppAsset.icArrowRight,
              0,
              0,
              size: 18,
              selectedColor: AppColor.black02
          ),
        ],
      ),
    );
  }
}
