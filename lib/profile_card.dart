import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // โหมดเริ่มต้นเป็น Light Mode

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode, // ใช้ ThemeMode ตามสถานะ
      theme: ThemeData.light(), // ธีมโหมดสว่าง
      darkTheme: ThemeData.dark(), // ธีมโหมดมืด
      home: Scaffold(
        backgroundColor: _themeMode == ThemeMode.light
            ? Colors.pink[50]
            : Colors.grey[900], // เปลี่ยนสีพื้นหลังตามธีม
        appBar: AppBar(
          title: const Text("Custom Widget"),
          centerTitle: true, // ทำให้ Title อยู่ตรงกลาง
          backgroundColor:
              _themeMode == ThemeMode.light ? Colors.purple : Colors.black87,
          actions: [
            IconButton(
              icon: Icon(
                _themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: _toggleTheme, // กดแล้วเปลี่ยนธีม
            ),
          ],
        ),
        body: const Center(
          child: ProfileCard(
            name: "Chanipon Singtong",
            position: "Student",
            email: "singtong_c2@silpakorn.edu",
            phoneNumber: "0821394214",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/a/a3/June_odd-eyed-cat.jpg",
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // เพิ่มมิติให้ Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              position,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(thickness: 1, height: 20),
            _InfoRow(icon: Icons.email, text: email, iconColor: Colors.blue),
            const SizedBox(height: 10),
            _InfoRow(
                icon: Icons.phone, text: phoneNumber, iconColor: Colors.green),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const _InfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
