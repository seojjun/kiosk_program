// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiosk_program/firebase_options.dart';
import 'package:kiosk_program/screens/home_screen.dart';
import 'package:kiosk_program/screens/menu_screen.dart';
import 'package:kiosk_program/widgets/menu_add_widget_.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  window.document.onContextMenu.listen((evt) => evt.preventDefault());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '리뷰 추천 키오스크',
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Pretendard',
      ),
      debugShowCheckedModeBanner: false,
      // home: const MenuAddWidget(),
      // home: const HomeScreen(),
      home: const MenuScreen(title: '리뷰 추천 키오스크'),
    );
  }
}
