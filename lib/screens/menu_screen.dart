import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenuScreen> {
  List menuImages = [
    "김밥.jpg",
    "돈까스.jpg",
    "떡볶이.jpg",
    "오므라이스.jpg",
    "쫄면.jpg",
    "카레.jpg",
  ];

  List menuNames = [
    "김밥",
    "돈까스",
    "떡볶이",
    "오므라이스",
    "쫄면",
    "카레",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  for (int i = 0; i < menuImages.length; i++)
                    Column(
                      children: [
                        Card(
                          child: Image.asset(
                            "assets/images/${menuImages[i]}",
                            height: 200,
                          ),
                        ),
                        Text(menuNames[i])
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
