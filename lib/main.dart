import 'package:flutter/material.dart';

import 'sciChat_home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "SciChat",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SciChat());
  }
}
