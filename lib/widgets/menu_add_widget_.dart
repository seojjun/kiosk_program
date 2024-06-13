import 'package:flutter/material.dart';
import 'package:kiosk_program/service/firestore_module.dart';

enum Category { korean, japanese, chinese, western }

class MenuAddWidget extends StatefulWidget {
  const MenuAddWidget({super.key});

  @override
  State<MenuAddWidget> createState() => _MenuAddWidgetState();
}

class _MenuAddWidgetState extends State<MenuAddWidget>
    with SingleTickerProviderStateMixin {
  Category category = Category.korean;
  TextEditingController menuNameController = TextEditingController();
  TextEditingController menuPriceController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: RadioListTile(
                  title: const Text("korean"),
                  value: Category.korean,
                  groupValue: category,
                  onChanged: (value) => setState(() => category = value!),
                ),
              ),
              SizedBox(
                width: 150,
                child: RadioListTile(
                  title: const Text("japanese"),
                  value: Category.japanese,
                  groupValue: category,
                  onChanged: (value) => setState(() => category = value!),
                ),
              ),
              SizedBox(
                width: 150,
                child: RadioListTile(
                  title: const Text("chinese"),
                  value: Category.chinese,
                  groupValue: category,
                  onChanged: (value) => setState(() => category = value!),
                ),
              ),
              SizedBox(
                width: 150,
                child: RadioListTile(
                  title: const Text("western"),
                  value: Category.western,
                  groupValue: category,
                  onChanged: (value) => setState(() => category = value!),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("메뉴"),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  focusNode: focusNode,
                  autofocus: true,
                  controller: menuNameController,
                  onSubmitted: (value) {
                    FirestoreModule.addMenu(
                      menuCategory: category.name,
                      menuName: menuNameController.text,
                      menuPrice: int.parse(menuPriceController.text),
                    );
                    FocusScope.of(context).requestFocus(focusNode);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("가격"),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  controller: menuPriceController,
                  onSubmitted: (value) {
                    FirestoreModule.addMenu(
                      menuCategory: category.name,
                      menuName: menuNameController.text,
                      menuPrice: int.parse(menuPriceController.text),
                    );
                    FocusScope.of(context).requestFocus(focusNode);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextButton(
              onPressed: () {
                FirestoreModule.addMenu(
                  menuCategory: category.name,
                  menuName: menuNameController.text,
                  menuPrice: int.parse(menuPriceController.text),
                );
              },
              child: const Text(
                "등록하기",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
