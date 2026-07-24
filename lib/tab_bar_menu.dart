import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: TabBarPage()));

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('กล่องข้อความ'),
          backgroundColor: Colors.blue.shade200,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ทั้งหมด'),
              Tab(text: 'รออ่าน'),
              Tab(text: 'สำคัญ'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'ทั้งหมด',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                'รออ่าน',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                'สำคัญ',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}