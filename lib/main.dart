import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/provider/quran_pages_provider.dart';
import 'package:provider/provider.dart';

import 'features/great_tafsirs_feature/presentation/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
      ChangeNotifierProvider<QuranPagesProvider>(
        create: (ctx) => QuranPagesProvider(),
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Tafsirs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
    );
  }
}
