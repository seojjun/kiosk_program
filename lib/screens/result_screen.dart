import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
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
