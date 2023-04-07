import 'package:domain/features/documents/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/l10n/localization.dart';
import 'package:presentation/theme/app_theme.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category, required this.isLast})
      : super(key: key);

  final Category category;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(category.image),
                SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: AppTheme.boldTextStyle,
                    ),
                    Text(
                      Localization.texts.categoryStatus(
                          category.filesCount, category.hoursCount),
                      style: AppTheme.normalTextStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          if (!isLast)
            Divider(
              color: AppTheme.lightGrey,
              height: 1,
            )
        ],
      ),
    );
  }
}
