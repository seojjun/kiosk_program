import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/custom_scroll_behavior.dart';
import 'package:kiosk_program/utils/functions.dart';
import 'package:kiosk_program/widgets/custom_button.dart';
import 'package:kiosk_program/widgets/pop_dialog_button.dart';
import 'package:provider/provider.dart';

class OrderDialog extends StatelessWidget {
  const OrderDialog({
    super.key,
    required this.onTapEvent,
  });

  final Function onTapEvent;

  @override
  Widget build(BuildContext context) {
    final menuList = context
        .read<PaymentAmountProvider>()
        .menuMap
        .keys
        .toList()
        .reversed
        .toList();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: SizedBox(
                    width: 600,
                    height: 370,
                    child: DataTable2(
                      headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      // dataTextStyle: const TextStyle(
                      //   fontWeight: FontWeight.w900,
                      // ),
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      columns: const [
                        DataColumn2(
                          label: Text('메뉴'),
                        ),
                        DataColumn2(
                          label: Text('수량'),
                        ),
                        DataColumn2(
                          label: Text('금액'),
                        ),
                      ],
                      rows: List<DataRow2>.generate(
                        menuList.length,
                        (index) {
                          var menuName = menuList[index];
                          var provider =
                              context.watch<PaymentAmountProvider>().menuMap;

                          return DataRow2(
                            cells: [
                              DataCell(
                                Text(
                                  menuName,
                                ),
                              ),
                              DataCell(
                                Text(
                                  provider[menuName]['orders'].toString(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  numberFormatting(
                                    provider[menuName]?['price'] *
                                        provider[menuName]?['orders'],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      '총 결제 금액 : ${numberFormatting(context.read<PaymentAmountProvider>().amount)}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: '이전',
                      btnColor: bottomColor,
                      textColor: Colors.white,
                      onTapEvent: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                      text: '결제',
                      btnColor: inversePrimaryColor,
                      textColor: Colors.white,
                      onTapEvent: () {
                        onTapEvent();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const PopDialogButton(),
        ],
      ),
    );
  }
}
