import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/routing/routes.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/section_title_widget.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/category_model.dart';
import 'categories_grid_widget.dart';

class CategorySectionWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategorySectionWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitleWidget(
          title: StringsConstants.categories,
          onTap: () {
            context.pushNamed(Routes.doctors, arguments: ["All", categories]);
          },
        ),
        verticalSpacing(10.h),
        CategoriesGridWidget(categories: categories),
      ],
    );
  }
}
