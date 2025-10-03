import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krakeeb/core/utils/constants/app_colors.dart';
import 'package:krakeeb/features/home/models/waste_item_model.dart';
import 'package:krakeeb/features/home/widgets/custom_elevated_item_botton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWasteItemFiels extends StatelessWidget {
  final WasteItem item;

  const CustomWasteItemFiels({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 155.w,
     // height: 183.h,
      decoration: BoxDecoration(
        color: AppColors.categoryContaineBackGroundColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(child: Image.asset(item.imagePath)),
           SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              Text(
                item.price,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0XFFA7A7A780),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

           SizedBox(height: 4.h),
          CustomElevatedItemBotton(item: item),
        ],
      ),
    );
  }
}
