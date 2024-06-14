import 'package:flutter/material.dart';

class PaymentAmountProvider with ChangeNotifier {
  int _amount = 0;
  final Map<String, Map<String, int>> _menuMap = {};

  Map get menuMap => _menuMap;
  int get amount => _amount;

  void addMenu({required String name, required int price}) {
    _amount += price;

    _menuMap.update(
      name,
      (existingVinnerMap) {
        return existingVinnerMap;
      },
      ifAbsent: () => {'price': price},
    );

    _menuMap[name]?.update(
      'orders',
      (existingValue) => existingValue + 1,
      ifAbsent: () => 1,
    );

    notifyListeners();
  }

  void removeMenu({required String name, required int price}) {
    _amount -= price;

    late int orders;

    _menuMap[name]?.update(
      'orders',
      (existingValue) {
        orders = existingValue - 1;
        return orders;
      },
      ifAbsent: () => 0,
    );

    if (orders == 0) {
      _menuMap.remove(name);
    }

    notifyListeners();
  }

  void deleteMenu({required String name}) {
    int price = _menuMap[name]!['price']! * _menuMap[name]!['orders']!;

    _amount -= price;
    _menuMap.remove(name);

    notifyListeners();
  }
}
