import 'package:flutter/material.dart';
import 'package:kiosk_program/models/firestore_module.dart';
import 'package:kiosk_program/utils/colors.dart';
import 'package:kiosk_program/widgets/menu_box.dart';
import 'package:kiosk_program/widgets/menu_info_dialog.dart';

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
      menuName.add(FirestoreModule.menuInfo[widget.menuCategory][id]['name']);
      menuPrice.add(FirestoreModule.menuInfo[widget.menuCategory][id]['price']);
    }
  }

  void showMenuInfoDialog(String menuName, int menuPrice) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return MenuInfoDialog(
          menuName: menuName,
          menuPrice: menuPrice,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, widget) {
        return Transform.scale(
          scale: anim1.value,
          child: Opacity(
            opacity: anim1.value,
            child: widget,
          ),
        );
      },
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
    );
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
              mainAxisExtent: width,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: menuId.length,
            itemBuilder: (context, index) {
              return MenuBox(
                menuName: menuName[index],
                menuPrice: menuPrice[index],
                width: width,
                onTapSowMenuInfoDialog: showMenuInfoDialog,
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
