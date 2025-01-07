import 'package:flutter/material.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text('Category: Electronics',
                style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildProduct('Laptop', '999 THB'),
              buildProduct('Smartphone', '699 THB'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildProduct('Tablet', '499 THB'),
              buildProduct('Camera', '299 THB'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProduct(String name, String price) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 10),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(price),
      ],
    );
  }
}
