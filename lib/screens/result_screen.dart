// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/screen_route.dart';

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
