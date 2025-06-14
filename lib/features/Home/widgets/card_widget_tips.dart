import 'package:flutter/material.dart';
import 'package:your_health/core/model/Tips_model.dart';

class CardWidgetTips extends StatelessWidget {
  final TipsModel tipsModel;
  const CardWidgetTips({super.key, required this.tipsModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // أضف لونًا للـ Container لرؤية المنحنى بوضوح
          borderRadius: BorderRadius.circular(8), // المنحنى المطلوب
          boxShadow: [
            // يمكنك إضافة ظل خفيف إذا أردت إبراز البطاقة
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // تغيير موضع الظل
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: tipsModel.postImageUrl != null &&
                      tipsModel.postImageUrl!.isNotEmpty
                  ? Image.network(
                      tipsModel.postImageUrl!,
                      fit: BoxFit.cover,
                      height: 160,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 80),
                    )
                  : Container(
                      height: 160,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 80),
                    ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              tipsModel.postTitle ?? "عنوان غير متوفر ",
              style: const TextStyle(fontSize: 26),
            ),
            Text(
              tipsModel.authorName ?? "كاتب غير متوفر",
              textAlign: TextAlign.right,
            ),
            Text(tipsModel.postDate ?? "تاريخ غير موجود"),
          ],
        ),
      ),
    );
  }
}
