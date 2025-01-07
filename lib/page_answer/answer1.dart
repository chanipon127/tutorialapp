import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Layout'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer(Colors.red),
                const SizedBox(width: 20),
                buildContainer(Colors.green),
                const SizedBox(width: 20),
                buildContainer(Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer(Colors.orange),
                const SizedBox(width: 20),
                buildContainer(Colors.purple),
                const SizedBox(width: 20),
                buildContainer(Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
