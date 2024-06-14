import 'package:flutter/material.dart';
import 'package:kiosk_program/screens/menu_screen.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:kiosk_program/widgets/menu_carousel_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inversePrimaryColor,
        title: const Text(
          'GTEC 리뷰 추천 키오스크',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MenuCarouselView(),
            CustomButton(
              text: 'test',
              btnColor: inversePrimaryColor,
              textColor: Colors.white,
              onTapEvent: () {
                Navigator.of(context).push(menuScreenRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Route menuScreenRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const MenuScreen(title: '메뉴'),
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
