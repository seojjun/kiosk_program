import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/widgets/custom_button.dart';

class MenuCarouselView extends StatefulWidget {
  const MenuCarouselView({super.key});

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

    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < 2) {
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
    return ExpandableCarousel(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
