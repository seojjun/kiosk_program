import 'package:flutter/material.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/custom_scroll_behavior.dart';
import 'package:kiosk_program/utils/functions.dart';
import 'package:kiosk_program/widgets/added_menu_box.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class MenuBottomBar extends StatefulWidget {
  const MenuBottomBar({super.key});

  @override
  State<MenuBottomBar> createState() => _MenuBottomBarState();
}

class _MenuBottomBarState extends State<MenuBottomBar> {
  @override
  Widget build(BuildContext context) {
    final menuList = context
        .read<PaymentAmountProvider>()
        .menuMap
        .keys
        .toList()
        .reversed
        .toList();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: bottomColor,
        border: const Border(
          top: BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bottomColorWithOpacity,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: menuList.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: menuList.length,
                          itemBuilder: (context, index) {
                            var menuName = menuList[index];
                            var provider =
                                context.watch<PaymentAmountProvider>().menuMap;

                            return AddedMenuBox(
                              menuName: menuName,
                              menuPrice: provider[menuName]?['price'],
                              menuOrders: provider[menuName]?['orders'],
                            );
                          },
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '합계 : ${numberFormatting(context.watch<PaymentAmountProvider>().amount)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: '주문하기',
                    textColor: Colors.white,
                    btnColor: inversePrimaryColor,
                    onTapEvent: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
