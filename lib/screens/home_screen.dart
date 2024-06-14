import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_program/screens/menu_screen.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/data_info.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:kiosk_program/widgets/menu_carousel_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomColorWithOpacity,
      appBar: AppBar(
        backgroundColor: inversePrimaryColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuCarouselView(
                menuBanners: [
                  BannerModel(imagePath: 'assets/menu/김밥.jpg', id: '1'),
                  BannerModel(imagePath: 'assets/menu/돈까스.jpg', id: '2'),
                  BannerModel(imagePath: 'assets/menu/떡볶이.jpg', id: '3'),
                  BannerModel(imagePath: 'assets/menu/오므라이스.jpg', id: '4'),
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
      ),
    );
  }
}

Route menuScreenRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const MenuScreen(title: menuScreenTitle),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
