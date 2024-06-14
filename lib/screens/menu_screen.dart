import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/data_info.dart';
import 'package:kiosk_program/widgets/menu_bottom_bar.dart';
import 'package:kiosk_program/widgets/menu_tab_bar_view.dart';
import 'package:kiosk_program/widgets/menu_tab_bar.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MenuScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> menuTabList = [
    const Tab(text: korean),
    const Tab(text: japanese),
    const Tab(text: chinese),
    const Tab(text: western),
  ];
  late TabController tabController = TabController(
    length: menuCategory.length,
    vsync: this,
  );

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 100,
              child: MenuTabBar(
                tabController: tabController,
                menuTabList: menuTabList,
              ),
            ),
          ),
          MenuTabBarView(
            tabController: tabController,
          ),
          const MenuBottomBar(),
        ],
      ),
    );
  }
}
