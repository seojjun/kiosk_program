// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kiosk_program/screens/review_screen.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/data_info.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<void> waitCookingTime() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context).pushReplacement(reviewScreenRoute());
  }

  @override
  Widget build(BuildContext context) {
    waitCookingTime();
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
            child: Center(
              child: Text(
                '조리 중...',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/gif/chef_2.gif',
          ),
        ],
      ),
    );
  }
}

Route reviewScreenRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ReviewScreen(title: reviewScreenTitle),
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
