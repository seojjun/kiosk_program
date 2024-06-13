import 'package:flutter/material.dart';
import 'package:kiosk_program/widgets/menu_carousel_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const MenuCarouselView();
  }
}
