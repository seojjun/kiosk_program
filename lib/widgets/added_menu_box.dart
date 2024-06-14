import 'package:flutter/material.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/utils/functions.dart';
import 'package:kiosk_program/widgets/added_menu_box_button.dart';
import 'package:kiosk_program/widgets/added_menu_delete_button.dart';
import 'package:provider/provider.dart';

class AddedMenuBox extends StatelessWidget {
  const AddedMenuBox({
    super.key,
    required this.menuName,
    required this.menuPrice,
    required this.menuOrders,
  });

  final String menuName;
  final int menuPrice;
  final int menuOrders;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 140,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  menuName,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                Text(
                  numberFormatting(menuPrice * menuOrders),
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddedMenuBoxButton(
                      icon: Icons.add,
                      hoverColor: Colors.blue,
                      onTapEvent: () {
                        context.read<PaymentAmountProvider>().addMenu(
                              name: menuName,
                              price: menuPrice,
                            );
                      },
                    ),
                    Text(
                      menuOrders.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    AddedMenuBoxButton(
                      icon: Icons.remove,
                      hoverColor: Colors.red,
                      onTapEvent: () {
                        context.read<PaymentAmountProvider>().removeMenu(
                              name: menuName,
                              price: menuPrice,
                            );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        AddedMenuDeleteButton(
          onTapEvent: () {
            context.read<PaymentAmountProvider>().deleteMenu(name: menuName);
          },
        )
      ],
    );
  }
}
