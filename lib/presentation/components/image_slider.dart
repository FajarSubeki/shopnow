import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopnow/resources/app_asset.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return Container(
                width: _currentIndex == entry.key ? 12.0 : 8.0,
                height: _currentIndex == entry.key ? 12.0 : 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.white : Colors.grey,
                  border: Border.all(color: Colors.black.withOpacity(0.5)), // Optional border
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
