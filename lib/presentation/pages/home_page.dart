import 'package:flutter/material.dart';
import 'package:shopnow/data/datasource/dummy_data.dart';
import 'package:shopnow/presentation/components/bordered_text.dart';
import 'package:shopnow/presentation/components/gradient_text_field.dart';
import 'package:shopnow/presentation/components/image_slider.dart';
import 'package:shopnow/presentation/components/product_item.dart';
import 'package:shopnow/presentation/components/user_item.dart';
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
      backgroundColor: AppColor.white02,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gradientTextField(),
              bannerSlider(),
              topProduct(),
              topUser(),
              footerLogo()
            ],
          ),
        ),
      ),
    );
  }

  Widget gradientTextField() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      color: AppColor.white,
        child: Padding(
          padding: EdgeInsets.only(top: 26, left: 18, right: 18),
          child: GradientTextField(
            hintText: AppString.search,
            icon: Icons.search,
            controller: TextEditingController(),
          ),
        ),
    );
  }

  Widget bannerSlider() {
    return ImageSlider();
  }

  Widget topProduct() {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 6, right: 6),
      color: AppColor.white,
      child: Column(
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
      ),
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

  Widget titleUser() {
    return Container(
      color: AppColor.white,
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
      child: Row(
        children: [
          /// Left Labels
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                Text(
                    AppString.topUserTitle,
                    style: textStyle.copyWith(
                        color: AppColor.grey03,
                        fontSize: 12
                    )
                ),
                SizedBox(height: 4),
                Text(
                  AppString.topUserSubTitle,
                  style: TextStyle(fontSize: 18, color: AppColor.black01),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topUser() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleUser(),
          SizedBox(
              height: 140, // Adjust based on your image size
              child: Padding(
                padding: EdgeInsets.only(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: DummyData.users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 20),
                      color: AppColor.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: UserItem(
                          index: index,
                          user: DummyData.users[index],
                          isFirstItem: index == 0, // Pass true for the first item
                        ),
                      ),
                    );
                  },
                ),
              )
          )

        ],
      ),
    );
  }

  Widget footerLogo() {
    return Container(
      margin: EdgeInsets.only(top: 22, left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            AppString.logoInc,
            style: textStyle.copyWith(
              fontSize: 15,
              color: AppColor.grey02,
              fontWeight: medium
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            child: Row(
              children: [
                Wrap(
                  spacing: 20, // Adjust space between items
                  runSpacing: 5, // Space between lines if wrapped
                  alignment: WrapAlignment.center,
                  children: [
                    textItem(AppString.aboutMe),
                    divider(),
                    textItem(AppString.career),
                    divider(),
                    textItem(AppString.blog),
                    divider(),
                    textItem(AppString.reviewCopy),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 6,
                children: [
                  Util.buildSvgIcon(
                      AppAsset.icArrow,
                      0,
                      0,
                      size: 14,
                      selectedColor: AppColor.grey10
                  ),
                  Text(
                    AppString.reviewLogo,
                    style: textStyle.copyWith(fontSize: 13, color: AppColor.grey02),
                  )
                ],
              ),
              BorderedText(
                text: AppString.korea,
                borderColor: Colors.grey,
                borderWidth: 1.0,
                borderRadius: 10.0,
                textStyle: textStyle.copyWith(
                  color: AppColor.grey02,
                  fontSize: 13
                ),
                icon: Icons.arrow_drop_down_outlined, // Custom arrow icon
                iconColor: AppColor.grey02,
                iconSize: 18.0,
              )
            ],
          ),
          Divider(
            color: AppColor.grey06, // Line color
            thickness: 1, // Line thickness
            height: 1, // Adjust spacing if needed
          ),
          Text(
            AppString.copyright,
            style: textStyle.copyWith(fontSize: 14, color: AppColor.grey02),
          )
        ],
      ),
    );
  }

  Widget textItem(String text) {
    return Text(
      text,
      style: textStyle.copyWith(fontSize: 14, color: AppColor.grey02),
    );
  }

  Widget divider() {
    return Text(
      "|",
      style: textStyle.copyWith(fontSize: 10, color: AppColor.grey03),
    );
  }

}
