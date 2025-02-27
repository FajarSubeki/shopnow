import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_color.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  final List<String> imageList = [
    AppAsset.imgBanner1,
    AppAsset.imgBanner2,
    AppAsset.imgBanner3,
    AppAsset.imgBanner4,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: imageList.map((imagePath) {
            return Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            );
          }).toList(),
          options: CarouselOptions(
            height: 221, // Banner height
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              bool isActive = _currentIndex == entry.key;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isActive ? 18.0 : 8.0, // Rectangle width for active, circle for inactive
                height: 8.0, // Keep the same height for both
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isActive ? 4.0 : 50.0), // Rounded corners for rectangle
                  color: isActive ? Colors.white : AppColor.white02,
                ),
              );
            }).toList(),
          ),
        ),

      ],
    );
  }
}
