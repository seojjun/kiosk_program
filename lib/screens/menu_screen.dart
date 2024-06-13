import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/utils/menu_category.dart';
import 'package:kiosk_program/widgets/menu_list.dart';
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
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: MenuTabBar(
                  tabController: tabController,
                  menuTabList: menuTabList,
                ),
              ),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}
