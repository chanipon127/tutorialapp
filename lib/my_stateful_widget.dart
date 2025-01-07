import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("StatefulWidget"),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Couter = $counter",
                style: const TextStyle(fontSize: 22, color: Colors.blue)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (counter > 0) {
                        setState(() {
                          counter--;
                        });
                      }
                    },
                    child: const Icon(Icons.remove)),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: const Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    child: const Text("Reset"))
              ],
            )
          ],
        )));
  }
}
