import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiosk_program/service/firestore_module.dart';
import 'package:kiosk_program/utils/colors.dart';

class MenuList extends StatefulWidget {
  const MenuList({
    super.key,
    required this.menuCategory,
  });

  final String menuCategory;

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final double width = 247;

  List menuId = [];
  List menuName = [];
  List menuPrice = [];

  Future<void> getMenuData() async {
    menuId = [];
    menuName = [];
    menuPrice = [];

    await FirestoreModule.getMenuAllInfo(menuCategory: widget.menuCategory);

    menuId = FirestoreModule.menuInfo[widget.menuCategory].keys.toList();

    for (var id in menuId) {
      {
        menuName.add(FirestoreModule.menuInfo[widget.menuCategory][id]['name']);
        menuPrice
            .add(FirestoreModule.menuInfo[widget.menuCategory][id]['price']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMenuData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ width,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: menuId.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text(menuName[index]),
                    Text(
                      menuPrice[index].toString(),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: inversePrimaryColor,
            ),
          );
        }
      },
    );
  }
}
