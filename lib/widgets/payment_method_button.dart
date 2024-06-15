// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/screen_route.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PaymentMethodButton extends StatefulWidget {
  const PaymentMethodButton({
    super.key,
    required this.name,
    required this.onTapEvent,
  });

  final String name;
  final Function onTapEvent;

  @override
  State<PaymentMethodButton> createState() => _PaymentMethodButtonState();
}

class _PaymentMethodButtonState extends State<PaymentMethodButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          onHover: (value) {
            setState(() {
              isHovered = value;
            });
          },
          onTap: () async {
            widget.onTapEvent(
              '${widget.name}(으)로 결제 진행 중...',
              LoadingAnimationWidget.bouncingBall(
                color: inversePrimaryColor,
                size: 50,
              ),
            );

            await Future.delayed(const Duration(seconds: 5));

            Navigator.of(context).pushAndRemoveUntil(
              resultScreenRoute(),
              (route) => false,
            );
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: ShapeDecoration(
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              image: DecorationImage(
                colorFilter: isHovered
                    ? const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.multiply,
                      )
                    : null,
                image: AssetImage('assets/payment/${widget.name}.png'),
              ),
            ),
            child: isHovered
                ? const Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 193, 255, 249),
                    size: 75,
                  )
                : null,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
