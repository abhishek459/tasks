import 'package:tasks/navigation_service.dart';

import './server_service.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:tasks/home_page.dart';

void main() async {
  await Isar.initializeIsarCore();
  runApp(const MainApp());
  await ServerService.fetchServerLink();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
