import 'package:flutter/material.dart';
import 'package:kiosk_program/widgets/menu_list.dart';

class MenuTabBarView extends StatelessWidget {
  const MenuTabBarView({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TabBarView(
          controller: tabController,
          children: const [
            MenuList(menuCategory: 'korean'),
            MenuList(menuCategory: 'japanese'),
            MenuList(menuCategory: 'chinese'),
            MenuList(menuCategory: 'western'),
          ],
        ),
      ),
    );
  }
}
