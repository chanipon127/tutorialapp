import 'package:flutter/material.dart';

class SocialMediaPost extends StatelessWidget {
  const SocialMediaPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Post'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('User Name',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('5 minutes ago'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Like')),
                ElevatedButton(onPressed: () {}, child: const Text('Comment')),
                ElevatedButton(onPressed: () {}, child: const Text('Share')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
