import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MainPage()));

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _city = 'ยังไม่เลือก';

  Future<void> _pick() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const CityPage()),
    );
    if (result != null && mounted) {
      setState(() => _city = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('หน้าหลัก')),
      body: Center(
        child: ElevatedButton(
          onPressed: _pick,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: Text('เมืองที่เลือก: $_city'),
        ),
      ),
    );
  }
}

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cities = ['กรุงเทพมหานคร', 'เชียงใหม่', 'ลำปาง', 'ขอนแก่น', 'ภูเก็ต'];

    return Scaffold(
      appBar: AppBar(title: const Text('เลือกเมือง')),
      body: ListView(
        children: cities.map((c) => ListTile(
          title: Text(c),
          trailing: const Icon(Icons.location_city),
          onTap: () => Navigator.pop(context, c),
        )).toList(),
      ),
    );
  }
}