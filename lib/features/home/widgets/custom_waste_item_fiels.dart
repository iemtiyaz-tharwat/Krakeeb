import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krakeeb/core/utils/constants/app_colors.dart';
import 'package:krakeeb/features/home/models/waste_item_model.dart';

class CustomWasteItemFiels extends StatelessWidget {
  final WasteItem item;
  final VoidCallback onTap;

  const CustomWasteItemFiels({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 155,
        height: 183,
        decoration: BoxDecoration(
          color: AppColors.categoryContaineBackGroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(item.imagePath)
            ),
            const SizedBox(height: 8),

            
            Text(
              item.price,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0XFFA7A7A780),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            Container(
              height: 33,
              width: 155,
              decoration: BoxDecoration(
                color: Color(0xffAFDD69),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
