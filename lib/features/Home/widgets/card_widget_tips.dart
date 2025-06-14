import 'package:flutter/material.dart';
import 'package:your_health/core/model/Tips_model.dart';

class CardWidgetTips extends StatelessWidget {
  const CardWidgetTips({super.key, required this.tipsModel});
  final TipsModel tipsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              tipsModel.postImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
             
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tipsModel.postTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tipsModel.authorName,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      tipsModel.postDate.split('T')[0], // التاريخ فقط
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
