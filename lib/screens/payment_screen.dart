import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PaymentScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inversePrimaryColor,
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
