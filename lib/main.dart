import 'package:flutter/material.dart';
import 'list_detail.dart' as list_detail;
import 'pick_city.dart' as pick_city;
import 'drawer_menu.dart' as drawer_menu;
import 'tab_bar_menu.dart' as tab_bar_menu;
import 'confirm_exit.dart' as confirm_exit;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const list_detail.ListPage(),
      //home: const pick_city.MainPage(),
      //home: const drawer_menu.HomePage(),
      //home: const tab_bar_menu.TabBarPage(),
      //home: const confirm_exit.HomePage(),
    );
  }
}