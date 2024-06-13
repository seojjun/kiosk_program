import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({
    super.key,
    required this.tabController,
    required this.menuTabList,
  });

  final TabController tabController;
  final List<Tab> menuTabList;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: menuTabList,
      labelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      overlayColor: WidgetStatePropertyAll(tabColorWithOpacity),
      unselectedLabelColor: const Color(0xFFB1B5B8),
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      splashBorderRadius: BorderRadius.circular(100),
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: ShapeDecoration(
        color: tabColor,
        shape: const CircleBorder(),
      ),
      isScrollable: true,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      splashFactory: NoSplash.splashFactory,
    );
  }
}
