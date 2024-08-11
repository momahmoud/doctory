import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';
import 'package:gemini_comp/features/home/presentation/widgets/category_item_widget.dart';

import '../../../../core/routing/routes.dart';
import '../../data/models/category_model.dart';

class CategoriesGridWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesGridWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length > 8 ? 8 : categories.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.h,
        childAspectRatio: .8.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.pushNamed(Routes.doctors,
                arguments: [categories[index].name, categories]);
          },
          child: CategoryItemWidget(
            category: categories[index],
          ),
        );
      },
    );
  }
}
