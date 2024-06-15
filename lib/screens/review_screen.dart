import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/screens/home_screen.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/data_info.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: inversePrimaryColor,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
            child: Center(
              child: Text(
                '주문하신 메뉴에 대한 리뷰를 작성해 주세요!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          QrImageView(
            data: jsonEncode(context.read<PaymentAmountProvider>().menuMap),
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          ),
          const SizedBox(
            height: 75,
          ),
          CustomButton(
            text: '홈으로',
            btnColor: inversePrimaryColor,
            textColor: Colors.white,
            onTapEvent: () {
              context.read<PaymentAmountProvider>().reset();
              Navigator.of(context).pushReplacement(homeScreenRoute());
            },
          )
        ],
      ),
    );
  }
}

Route homeScreenRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const HomeScreen(title: homeScreenTitle),
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
