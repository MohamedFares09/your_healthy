import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/model/Tips_model.dart';
import 'package:your_health/features/tips/view/tips_details_screen.dart';



class CardWidgetTips extends StatelessWidget {
  const CardWidgetTips({super.key, required this.tipsModel});
  final TipsModel tipsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TipsDetailsScreen(tipsModel: tipsModel),
          ),
        );
      },
      child: Container(
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
            // صورة النصيحة
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                tipsModel.postImageUrl,
                height: 200.h,
                width: double.infinity.w,
                fit: BoxFit.cover,
              ),
            ),

            // باقي المعلومات
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // العنوان على اليمين
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      tipsModel.postTitle,
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   SizedBox(height: 8.h),

                  // الكاتب والتاريخ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          tipsModel.authorName,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        tipsModel.postDate.split('T')[0],
                        style:  TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
