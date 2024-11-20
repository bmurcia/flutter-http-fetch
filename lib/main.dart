
import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/ui/main_router.dart';
import 'package:flutter_http_fetch_data/ui/main_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Coctail App',
      theme: buidlMainTheme(context),
      routerConfig: mainRouter,
    );
  }
}

