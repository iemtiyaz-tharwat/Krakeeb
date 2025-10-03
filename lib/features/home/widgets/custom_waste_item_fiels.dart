import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SvgPicture.asset(
                item.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),

            // السعر فوق (رمادي)
            Text(
              item.price,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            // العنوان تحت (أسود Bold)
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
