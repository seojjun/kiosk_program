import 'package:flutter/material.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/functions.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:kiosk_program/widgets/pop_dialog_button.dart';
import 'package:provider/provider.dart';

class MenuInfoDialog extends StatelessWidget {
  const MenuInfoDialog({
    super.key,
    required this.menuName,
    required this.menuPrice,
  });

  final String menuName;
  final int menuPrice;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Container(
            width: 800,
            height: 600,
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                    ),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        menuName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        numberFormatting(menuPrice),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomButton(
                        text: '담기',
                        btnColor: inversePrimaryColor,
                        textColor: Colors.white,
                        onTapEvent: () {
                          context.read<PaymentAmountProvider>().addMenu(
                                name: menuName,
                                price: menuPrice,
                              );

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const PopDialogButton(),
        ],
      ),
    );
  }
}
