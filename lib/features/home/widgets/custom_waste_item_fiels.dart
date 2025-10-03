import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        color: AppColors.categoryContaineBackGroundColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(item.imagePath, width: 148, height: 200)),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  item.price,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0XFFA7A7A780),
                    fontWeight: FontWeight.w600,
                  ),
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
