// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/data_info.dart';
import 'package:kiosk_program/utils/screen_route.dart';
import 'package:kiosk_program/widgets/custom_alert_dialog.dart';
import 'package:kiosk_program/widgets/payment_method_button.dart';
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
  final double width = 200;

  Future<void> showWaitDialog(
      String title, Widget loadingAnimationWidget) async {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return CustomAlertDialog(
          title: title,
          loadingAnimationWidget: loadingAnimationWidget,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, widget) {
        return Transform.scale(
          scale: anim1.value,
          child: Opacity(
            opacity: anim1.value,
            child: widget,
          ),
        );
      },
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
    );

    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
            child: Center(
              child: Text(
                '결제 수단을 선택해 주세요',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ width,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: paymentMethod.length,
              itemBuilder: (context, index) {
                return PaymentMethodButton(
                  name: paymentMethod[index],
                  onTapEvent: showWaitDialog,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
