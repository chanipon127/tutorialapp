import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AQIScreen(),
    );
  }
}

class AQIScreen extends StatefulWidget {
  @override
  _AQIScreenState createState() => _AQIScreenState();
}

class _AQIScreenState extends State<AQIScreen> {
  String city = "Loading...";
  int? aqi;
  double? temperature;
  bool isLoading = false;

  // ฟังก์ชันดึงข้อมูล AQI จาก API
  Future<void> fetchAQIData() async {
    setState(() {
      isLoading = true;
    });

    // ignore: unused_local_variable
    String token = "d22c5222ec2f39d15cdab43ec843460620de7364"; // 🔑 ใส่ Token
    String url =
        "https://api.waqi.info/feed/bangkok/?token=d22c5222ec2f39d15cdab43ec843460620de7364";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data =
            json.decode(utf8.decode(response.bodyBytes)); // ✅ รองรับภาษาไทย
        setState(() {
          aqi = data['data']['aqi'];
          city = data['data']['city']['name'];
          temperature = (data['data']['iaqi']['t']['v'] as num?)?.toDouble();
        });
      } else {
        print("Failed to load AQI data");
      }
    } catch (e) {
      print("Error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  // ฟังก์ชันกำหนดระดับ AQI ตามช่วงค่า
  String getAqiScale(int aqi) {
    if (aqi <= 50) {
      return "Good";
    } else if (aqi <= 100) {
      return "Moderate";
    } else if (aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (aqi <= 200) {
      return "Unhealthy";
    } else if (aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  // ฟังก์ชันกำหนดสีพื้นหลังตามระดับ AQI
  Color getAqiColor(int aqi) {
    if (aqi <= 50) {
      return Colors.green;
    } else if (aqi <= 100) {
      return Colors.yellow;
    } else if (aqi <= 150) {
      return Colors.orange;
    } else if (aqi <= 200) {
      return Colors.red;
    } else if (aqi <= 300) {
      return Colors.purple;
    } else {
      return Colors.brown;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAQIData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Air Quality Index (AQI)"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(city,
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: aqi != null ? getAqiColor(aqi!) : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(aqi != null ? "$aqi" : "--",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(aqi != null ? getAqiScale(aqi!) : "Unknown",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                        temperature != null
                            ? "Temperature: ${temperature!.toStringAsFixed(1)}°C"
                            : "Temperature: --",
                        style: TextStyle(fontSize: 20)),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: fetchAQIData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Refresh",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
