import 'package:flutter/material.dart';

void main() {
  runApp(TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrafficLightScreen(),
    );
  }
}

//ใช้ StatefulWidget เพราะต้องการให้ไฟเปลี่ยนสถานะได้
class TrafficLightScreen extends StatefulWidget {
//createState() สร้าง _TrafficLightScreenState เพื่อควบคุม UI
  @override
  _TrafficLightScreenState createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  int _currentLight = 0; //ใช้เก็บสถานะของไฟปัจจุบัน

  void _changeLight() {
    //ใช้เปลี่ยนสถานะของไฟ
    setState(() {
      _currentLight = (_currentLight + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Light Animation'),
        centerTitle: true, // ทำให้ Title อยู่ตรงกลาง
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // จัดให้อยู่ตรงกลางแนวนอน
          children: [
            _buildLight(Colors.red, _currentLight == 0),
            _buildLight(Colors.yellow, _currentLight == 1),
            _buildLight(Colors.green, _currentLight == 2),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeLight,
              child: Text('เปลี่ยนไฟ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLight(Color color, bool isActive) {
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: isActive ? 1.0 : 0.3,
      child: Container(
        margin: EdgeInsets.all(8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: isActive
              ? [BoxShadow(color: color.withOpacity(0.6), blurRadius: 15)]
              : [],
        ),
      ),
    );
  }
}
