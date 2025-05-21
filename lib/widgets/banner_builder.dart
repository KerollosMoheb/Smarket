import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerBuilder extends StatefulWidget {
  const BannerBuilder({super.key});

  @override
  State<BannerBuilder> createState() => _BannerBuilderState();
}

class _BannerBuilderState extends State<BannerBuilder> {
  List<String> items = [
    'assets/banners/Slider 1.png',
    'assets/banners/Slider 2.png',
    'assets/banners/Slider 3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 170,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.6,
        aspectRatio: 1.0,
        initialPage: 0,
      ),
      itemCount: items.length,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) =>
              Image.asset(items[itemIndex]),
    );
  }
}
