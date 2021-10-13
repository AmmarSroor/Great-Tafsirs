import 'package:flutter/material.dart';

import 'features/great_tafsirs_feature/presentation/pages/splash_screen.dart';
import 'features/great_tafsirs_feature/presentation/pages/view_quran_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
    );
  }
}
