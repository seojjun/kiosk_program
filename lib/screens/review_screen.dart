import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/screen_route.dart';
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
