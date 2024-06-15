import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Text(
                '2024학년도 경기과학기술대학교 스마트소프트웨어제어 2학년 PBL프로젝트 기말평가\n\n2조 리뷰 추천 키오스크\n\n문서준, 박상민, 조정빈, 최현세',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
