import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('หน้าหลัก')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EditFormPage()),
            );
          },
          child: const Text('ไปหน้าแก้ไขข้อมูล'),
        ),
      ),
    );
  }
}

class EditFormPage extends StatefulWidget {
  const EditFormPage({super.key});

  @override
  State<EditFormPage> createState() => _EditFormPageState();
}

class _EditFormPageState extends State<EditFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขข้อมูล'),
        backgroundColor: Colors.orange.shade200,
      ),
      body: PopScope(
        canPop: false, 
        // ignore: deprecated_member_use
        onPopInvoked: (didPop) async {
          if (didPop) return;
          final leave = await showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('ทิ้งการแก้ไข?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false), 
                  child: const Text('อยู่ต่อ'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true), 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('ออก', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
          if (leave == true && context.mounted) {
            Navigator.pop(context); 
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'ชื่อ-นามสกุล',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ลองกดปุ่มย้อนกลับที่มุมซ้ายบน หรือปุ่มย้อนกลับของมือถือดูครับ',
                style: TextStyle(color: Colors.grey.shade700),
              )
            ],
          ),
        ),
      ),
    );
  }
}