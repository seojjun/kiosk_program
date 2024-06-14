// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiosk_program/firebase_options.dart';
import 'package:kiosk_program/providers/payment_amount_provider.dart';
import 'package:kiosk_program/screens/home_screen.dart';
import 'package:kiosk_program/screens/menu_screen.dart';
import 'package:kiosk_program/screens/payment_screen.dart';
import 'package:kiosk_program/screens/result_screen.dart';
import 'package:kiosk_program/utils/data_info.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => PaymentAmountProvider(),
      child: MaterialApp(
        title: '리뷰 추천 키오스크',
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'Pretendard',
        ),
        debugShowCheckedModeBanner: false,
        // home: const MenuAddWidget(),
        // home: const HomeScreen(title: homeScreenTitle),
        // home: const MenuScreen(title: menuScreenTitle),
        // home: const PaymentScreen(title: paymentScreenTitle),
        home: const ResultScreen(title: resultScreenTitle),
      ),
    );
  }
}
