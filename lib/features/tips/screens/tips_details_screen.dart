import 'package:flutter/material.dart';
import 'package:your_health/core/model/Tips_model.dart';

class TipsDetailsScreen extends StatelessWidget {
  const TipsDetailsScreen({super.key, required this.tipsModel});

  final TipsModel tipsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
              child: Text(
                tipsModel.postTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
              tipsModel.postImageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              tipsModel.postContent,
              style: const TextStyle(fontSize: 16, color: Color(0xff777777)),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
