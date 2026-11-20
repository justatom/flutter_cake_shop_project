import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/splash_screen_ui.dart';

void main() {
  runApp(const FlutterCakeShopApp());
}

class FlutterCakeShopApp extends StatelessWidget {
  const FlutterCakeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'สายด่วนกินเค้ก',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        fontFamily: GoogleFonts.kanit().fontFamily,
        useMaterial3: true,
      ),
      home: const SplashScreenUi(),
    );
  }
}
