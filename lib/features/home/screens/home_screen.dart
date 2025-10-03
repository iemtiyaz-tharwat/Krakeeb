import 'package:flutter/material.dart';
import 'package:krakeeb/core/utils/constants/app_colors.dart';
import 'package:krakeeb/core/utils/constants/category_values.dart';
import 'package:krakeeb/core/widgets/custom_app_bar.dart';
import 'package:krakeeb/features/home/widgets/custom_waste_item_fiels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: "Home"),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 44,
          mainAxisSpacing: 21,
          childAspectRatio: 0.9,
          children: List.generate(CategoryValues.wasteItems.length, (index) {
            return CustomWasteItemFiels(item: CategoryValues.wasteItems[index]);
          }),
        ),
      ),
    );
  }
}
