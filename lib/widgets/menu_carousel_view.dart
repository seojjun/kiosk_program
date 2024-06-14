import 'dart:async';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class MenuCarouselView extends StatefulWidget {
  const MenuCarouselView({
    super.key,
    required this.menuBanners,
  });

  final List<BannerModel> menuBanners;

  @override
  State<MenuCarouselView> createState() => _MenuCarouselViewState();
}

class _MenuCarouselViewState extends State<MenuCarouselView> {
  int currentPage = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentPage < widget.menuBanners.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerCarousel.fullScreen(
      pageController: pageController,
      banners: widget.menuBanners,
      customizedIndicators: const IndicatorModel.animation(
        width: 20,
        height: 5,
        spaceBetween: 2,
        widthAnimation: 50,
      ),
      height: 550,
      activeColor: Colors.amberAccent,
      disableColor: Colors.white,
      animation: true,
      borderRadius: 10,
      indicatorBottom: false,
    );
  }
}
