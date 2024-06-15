import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/screen_route.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:kiosk_program/widgets/menu_carousel_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomColorWithOpacity,
      appBar: AppBar(
        backgroundColor: inversePrimaryColor,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).push(creditScreenRoute());
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 3,
            ),
            MenuCarouselView(
              menuBanners: [
                BannerModel(imagePath: 'assets/menu/korean/김밥.jpg', id: '1'),
                BannerModel(
                    imagePath: 'assets/menu/japanese/오므라이스.jpg', id: '2'),
                BannerModel(
                    imagePath: 'assets/menu/chinese/새우볶음밥.jpg', id: '3'),
                BannerModel(
                    imagePath: 'assets/menu/western/오일 스파게티.jpg', id: '4'),
              ],
            ),
            CustomButton(
              text: '메뉴 보기',
              btnColor: inversePrimaryColor,
              textColor: Colors.white,
              onTapEvent: () {
                Navigator.of(context).push(menuScreenRoute());
              },
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
